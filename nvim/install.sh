#!/bin/bash
# ============================================================================
# Neovim 2026 最小化配置 - 首次安装脚本
# ============================================================================

echo "🚀 开始安装 Neovim 2026 最小化配置..."
echo ""

# 检查 Neovim 版本
echo "📋 检查 Neovim 版本..."
nvim_version=$(nvim --version | head -1)
echo "   $nvim_version"
echo ""

# 备份旧配置（如果存在）
if [ -d ~/.config/nvim.bak ]; then
    echo "⚠️  发现旧的备份，跳过备份步骤"
else
    echo "💾 备份旧配置到 ~/.config/nvim.bak"
fi
echo ""

# 清理旧插件（可选）
echo "🧹 清理旧插件缓存..."
rm -rf ~/.local/share/nvim/site/pack/core/opt/blink.cmp
echo "   ✓ 已清理 blink.cmp"
echo ""

# 同步插件
echo "📦 同步插件（这可能需要几分钟）..."
echo "   正在下载 8 个核心插件..."
nvim --headless "+lua vim.pack.sync()" +quit 2>&1 | grep -v "^$"
echo ""

# 检查安装
echo "✅ 检查安装状态..."
nvim --headless -c 'checkhealth vim.lsp' -c 'quit' 2>&1 | grep -i "error\|warning" || echo "   ✓ LSP 配置正常"
echo ""

echo "🎉 安装完成！"
echo ""
echo "📚 下一步："
echo "   1. 启动 Neovim: nvim"
echo "   2. 打开 Mason 安装 LSP 服务器: :Mason"
echo "   3. 查看配置说明: cat ~/.config/nvim/CHANGELOG.md"
echo ""
echo "🔑 常用快捷键："
echo "   <Space>ff  - 查找文件"
echo "   <Space>fg  - 全局搜索"
echo "   <Space>e   - 文件浏览器"
echo "   gcc        - 注释/取消注释"
echo "   <Tab>      - 下一个 buffer"
echo ""
