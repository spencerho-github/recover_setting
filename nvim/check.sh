#!/bin/bash
# ============================================================================
# Neovim 2026 配置验证脚本
# ============================================================================

echo "🔍 检查 Neovim 配置..."
echo ""

# 1. 检查版本
echo "1️⃣  检查 Neovim 版本..."
nvim --version | head -1
echo ""

# 2. 列出配置文件
echo "2️⃣  配置文件结构..."
tree -L 3 ~/.config/nvim 2>/dev/null || find ~/.config/nvim -type f -name "*.lua" | head -20
echo ""

# 3. 检查插件配置
echo "3️⃣  已配置的插件..."
grep -E "name = |src = " ~/.config/nvim/lua/plugins/init.lua | grep -v "^--" | head -20
echo ""

# 4. 快速测试
echo "4️⃣  测试配置加载..."
nvim --headless -c 'lua print("✓ Config loaded successfully")' -c 'quit' 2>&1 | grep -E "✓|Error" || echo "   ✓ 无错误"
echo ""

echo "✅ 检查完成！"
echo ""
echo "📝 下一步："
echo "   1. 运行: ./install.sh"
echo "   2. 或直接启动: nvim"
echo "   3. 安装 LSP: :Mason"
echo ""
