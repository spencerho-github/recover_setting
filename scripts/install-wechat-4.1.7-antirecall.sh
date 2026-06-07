#!/usr/bin/env bash
set -euo pipefail

APP_PATH="/Applications/WeChat.app"
SOURCE_DMG=""
EXPECTED_BUILD="34888"
EXPECTED_SHORT_VERSION="4.1.7"
DRY_RUN=0
SKIP_BUILD=0
SKIP_RESIGN=0
NO_BACKUP=0
FORCE=0
QUIT_WECHAT=0
FRESH_FROM_DMG=0

usage() {
  cat <<'USAGE'
Usage:
  scripts/install-wechat-4.1.7-antirecall.sh [options]

Installs the stable static anti-recall patch for WeChat Mac 4.1.7 (build 34888)
and blocks Sparkle automatic update checks.

Options:
  --app <path>       WeChat.app path. Default: /Applications/WeChat.app
  --source-dmg <dmg> Source WeChat 4.1.7 dmg. Default with --fresh-from-dmg:
                     /Users/spencer/Downloads/WeChatMac_4.1.7.dmg
  --fresh-from-dmg   Replace the app bundle from the source dmg before patching.
  --dry-run          Check version and patch hits without changing files.
  --skip-build       Use an existing .build/release/wechat-antirecall binary.
  --skip-resign      Pass --skip-resign to the installer.
  --no-backup        Pass --no-backup to the installer.
  --quit-wechat      Ask WeChat to quit before installing, then wait.
  --force            Skip the 4.1.7 / 34888 version guard.
  -h, --help         Show this help.

Notes:
  This script intentionally uses the silent static patch, not runtime dylib
  injection and not the experimental in-chat recall-tip patch.
USAGE
}

die() {
  echo "error: $*" >&2
  exit 1
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --app)
      [[ $# -ge 2 ]] || die "--app requires a path"
      APP_PATH="$2"
      shift 2
      ;;
    --source-dmg)
      [[ $# -ge 2 ]] || die "--source-dmg requires a path"
      SOURCE_DMG="$2"
      shift 2
      ;;
    --fresh-from-dmg)
      FRESH_FROM_DMG=1
      shift
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    --skip-build)
      SKIP_BUILD=1
      shift
      ;;
    --skip-resign)
      SKIP_RESIGN=1
      shift
      ;;
    --no-backup)
      NO_BACKUP=1
      shift
      ;;
    --quit-wechat)
      QUIT_WECHAT=1
      shift
      ;;
    --force)
      FORCE=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      die "unknown option: $1"
      ;;
  esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
TOOL_PATH="${REPO_ROOT}/.build/release/wechat-antirecall"
PLIST_PATH="${APP_PATH}/Contents/Info.plist"
MACHO_PATH="${APP_PATH}/Contents/MacOS/WeChat"

if [[ -z "${SOURCE_DMG}" ]]; then
  SOURCE_DMG="/Users/spencer/Downloads/WeChatMac_4.1.7.dmg"
fi

[[ -d "${APP_PATH}" ]] || die "WeChat app not found: ${APP_PATH}"
[[ -f "${PLIST_PATH}" ]] || die "Info.plist not found: ${PLIST_PATH}"
[[ -f "${MACHO_PATH}" ]] || die "WeChat executable not found: ${MACHO_PATH}"

short_version="$(/usr/libexec/PlistBuddy -c 'Print :CFBundleShortVersionString' "${PLIST_PATH}" 2>/dev/null || true)"
build_version="$(/usr/libexec/PlistBuddy -c 'Print :CFBundleVersion' "${PLIST_PATH}" 2>/dev/null || true)"

echo "WeChat app: ${APP_PATH}"
echo "Detected version: ${short_version:-unknown} (${build_version:-unknown})"

if [[ "${FORCE}" -ne 1 ]]; then
  [[ "${short_version}" == "${EXPECTED_SHORT_VERSION}" ]] || die "expected WeChat ${EXPECTED_SHORT_VERSION}; use --force to override"
  [[ "${build_version}" == "${EXPECTED_BUILD}" ]] || die "expected build ${EXPECTED_BUILD}; use --force to override"
fi

if [[ -z "${DEVELOPER_DIR:-}" && -d "/Applications/Xcode.app/Contents/Developer" ]]; then
  export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"
fi

cd "${REPO_ROOT}"

wechat_pids() {
  pgrep -f "${APP_PATH}/Contents" || true
}

if [[ "${QUIT_WECHAT}" -eq 1 ]]; then
  running_pids="$(wechat_pids)"
  if [[ -n "${running_pids}" ]]; then
    echo "Asking WeChat to quit..."
    osascript -e 'tell application id "com.tencent.xinWeChat" to quit' >/dev/null 2>&1 \
      || osascript -e 'tell application "WeChat" to quit' >/dev/null 2>&1 \
      || true

    for _ in {1..60}; do
      running_pids="$(wechat_pids)"
      [[ -z "${running_pids}" ]] && break
      sleep 1
    done

    running_pids="$(wechat_pids)"
    if [[ -n "${running_pids}" ]]; then
      echo "WeChat is still running:"
      echo "${running_pids}"
      die "quit WeChat completely and rerun the script"
    fi
  fi
fi

if [[ "${FRESH_FROM_DMG}" -eq 1 ]]; then
  [[ "${DRY_RUN}" -eq 0 ]] || die "--fresh-from-dmg cannot be combined with --dry-run"
  [[ -f "${SOURCE_DMG}" ]] || die "source dmg not found: ${SOURCE_DMG}"

  running_pids="$(wechat_pids)"
  [[ -z "${running_pids}" ]] || die "WeChat is still running; rerun with --quit-wechat or quit it manually"

  mount_point="$(mktemp -d)"
  attached_device=""
  cleanup_mount() {
    if [[ -n "${attached_device}" ]]; then
      hdiutil detach "${attached_device}" >/dev/null 2>&1 || true
    fi
    rmdir "${mount_point}" >/dev/null 2>&1 || true
  }
  trap cleanup_mount EXIT

  echo "Mounting source dmg: ${SOURCE_DMG}"
  attach_output="$(hdiutil attach -nobrowse -readonly -mountpoint "${mount_point}" "${SOURCE_DMG}")"
  attached_device="$(printf '%s\n' "${attach_output}" | awk '$1 ~ "^/dev/" {print $1; exit}')"
  source_app="${mount_point}/WeChat.app"
  [[ -d "${source_app}" ]] || die "WeChat.app not found inside dmg"

  source_short_version="$(/usr/libexec/PlistBuddy -c 'Print :CFBundleShortVersionString' "${source_app}/Contents/Info.plist" 2>/dev/null || true)"
  source_build_version="$(/usr/libexec/PlistBuddy -c 'Print :CFBundleVersion' "${source_app}/Contents/Info.plist" 2>/dev/null || true)"
  echo "Source version: ${source_short_version:-unknown} (${source_build_version:-unknown})"
  if [[ "${FORCE}" -ne 1 ]]; then
    [[ "${source_short_version}" == "${EXPECTED_SHORT_VERSION}" ]] || die "source dmg is not WeChat ${EXPECTED_SHORT_VERSION}"
    [[ "${source_build_version}" == "${EXPECTED_BUILD}" ]] || die "source dmg is not build ${EXPECTED_BUILD}"
  fi

  if [[ -d "${APP_PATH}" ]]; then
    backup_app="${APP_PATH}.bundle-backup-$(date +%Y%m%d-%H%M%S)"
    echo "Moving existing app bundle to: ${backup_app}"
    mv "${APP_PATH}" "${backup_app}"
  fi

  echo "Copying clean WeChat.app from dmg..."
  ditto "${source_app}" "${APP_PATH}"
  PLIST_PATH="${APP_PATH}/Contents/Info.plist"
  MACHO_PATH="${APP_PATH}/Contents/MacOS/WeChat"
fi

if [[ "${SKIP_BUILD}" -ne 1 ]]; then
  echo "Building release installer..."
  swift build -c release
elif [[ ! -x "${TOOL_PATH}" ]]; then
  die "release installer not found: ${TOOL_PATH}"
fi

install_args=(
  install
  --app "${APP_PATH}"
  --block-update
)

if [[ "${DRY_RUN}" -eq 1 ]]; then
  install_args+=(--dry-run)
fi
if [[ "${SKIP_RESIGN}" -eq 1 ]]; then
  install_args+=(--skip-resign)
fi
if [[ "${NO_BACKUP}" -eq 1 ]]; then
  install_args+=(--no-backup)
fi

echo "Installing stable static anti-recall patch and update blocker..."
"${TOOL_PATH}" "${install_args[@]}"

if [[ "${DRY_RUN}" -eq 0 ]]; then
  echo "Verifying no runtime dylib injection is present..."
  if otool -L "${MACHO_PATH}" | grep -E 'WeChatAntiRecall|libWeChatAntiRecall|@loader_path/libWeChatAntiRecall' >/dev/null; then
    die "runtime anti-recall dylib is still linked in ${MACHO_PATH}"
  fi

  echo "Verifying code signature..."
  codesign --verify --deep --strict "${APP_PATH}"
fi

echo "Done."
