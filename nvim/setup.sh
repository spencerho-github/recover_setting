#!/bin/bash

# Neovim 配置初始化脚本

echo "🚀 正在初始化 Neovim 配置..."
echo ""

# 检查 Neovim 是否安装
if ! command -v nvim &> /dev/null; then
    echo "❌ 未检测到 Neovim，请先安装："
    echo "   brew install neovim"
    exit 1
fi

echo "✓ Neovim 已安装"

# 检查 Git
if ! command -v git &> /dev/null; then
    echo "❌ 未检测到 Git，请先安装"
    exit 1
fi

echo "✓ Git 已安装"

# 显示配置信息
echo ""
echo "📁 配置目录: ~/.config/nvim"
echo "🎨 主题: GitHub Light (Mac 原生风格)"
echo ""

# 首次启动提示
echo "📝 首次启动提示："
echo "   1. 启动 nvim 后，插件会自动开始安装"
echo "   2. 等待所有插件安装完成（可能需要几分钟）"
echo "   3. 插件安装完成后，执行 :checkhealth 检查状态"
echo "   4. 使用 :Mason 安装所需的 LSP 服务器"
echo ""

# 询问是否立即启动
read -p "是否现在启动 Neovim? (y/n): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🎉 启动 Neovim..."
    nvim
else
    echo "👋 稍后可以运行 'nvim' 启动编辑器"
fi
