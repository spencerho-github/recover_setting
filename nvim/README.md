# Neovim 2026 极简配置

> 基于 Neovim 0.12.2 的真正极简配置 | 7 个核心插件 | 原生补全 + 原生 LSP + vim.pack

## ✨ 特性

- 🚀 **真正极简**: 仅 7 个核心插件，无额外补全插件
- ⚡ **原生补全**: 使用 Neovim 0.10+ 内置补全
- 🔧 **原生 API**: 使用 Neovim 0.12 原生 LSP 和 vim.pack
- 🎨 **美观**: GitHub Dark 主题 + Lualine 状态栏
- 📦 **模块化**: 清晰的文件结构，易于维护

## 📦 核心插件（7个）

| 插件 | 功能 |
|------|------|
| **telescope.nvim** | 模糊查找 |
| **nvim-treesitter** | 语法高亮 |
| **mason.nvim** | LSP 管理器 |
| **lualine.nvim** | 状态栏 |
| **gitsigns.nvim** | Git 集成 |
| **nvim-tree.lua** | 文件浏览器 |
| **github-nvim-theme** | 主题 |

## 🎯 原生功能（无需插件）

- ✅ **补全** - Neovim 0.10+ 内置 omnifunc
- ✅ **注释** - Neovim 0.10+ 内置 gc
- ✅ **LSP** - Neovim 0.12+ 原生 API
- ✅ **插件管理** - Neovim 0.12+ vim.pack

## 🚀 快速开始

### 1. 安装插件

```bash
nvim
```

首次启动会自动下载插件（约1分钟）。

### 2. 安装 LSP 服务器

```vim
:Mason
```

选择：lua_ls, pyright, ts_ls, html, cssls

## ⌨️ 快捷键速查

### 文件与查找
- `<Space>e` - 文件浏览器
- `<Space>ff` - 查找文件
- `<Space>fg` - 全局搜索
- `<Tab>/<S-Tab>` - 切换 buffer

### 补全（原生）
- `Ctrl-n` - 触发 LSP 补全
- `Ctrl-p` - 上一个补全项
- `Enter` - 确认补全
- `Esc` - 关闭补全

### LSP
- `gd` - 跳转定义
- `gr` - 查找引用
- `K` - 显示文档
- `<Space>rn` - 重命名
- `<Space>f` - 格式化

### 编辑
- `gcc` - 注释行（原生）
- `gc{motion}` - 注释动作（原生）

## 🔧 亮点

- ✅ 使用 Neovim 原生补全（无需 nvim-cmp 或 blink.cmp）
- ✅ 原生 vim.pack 插件管理
- ✅ 原生 vim.lsp API
- ✅ 原生 gc 注释
- ✅ 相对行号、优化鼠标设置

## 📚 参考

- [Neovim Configuration for 2026](https://jarv.org/posts/neovim-config-2026/)
- [Neovim 0.12 Guide](https://martinlwx.github.io/en/config-neovim-from-scratch/)

---

**享受你的极简 Neovim！** 🎉
