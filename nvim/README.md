# Neovim 配置 - Mac 原生风格

基于 Neovim 0.12+ 原生插件管理的轻量级配置，采用 Mac 原生设计语言。

## 特性

- 🎨 **Mac 原生风格主题**：使用 GitHub 主题模拟 macOS 原生外观
- 📁 **模块化结构**：清晰的目录组织，易于维护
- ⚡ **快速启动**：使用 Neovim 0.12+ 原生插件管理器，无需第三方依赖
- 🔧 **开箱即用**：预配置 LSP、自动补全、语法高亮等功能
- 🎯 **简洁高效**：只包含必要插件，保持轻量

## 目录结构

```
~/.config/nvim/
├── init.lua                    # 配置入口
├── lua/
│   ├── config/
│   │   ├── options.lua        # 基础选项配置
│   │   ├── keymaps.lua        # 键位映射
│   │   └── autocmds.lua       # 自动命令
│   └── plugins/
│       ├── init.lua           # 插件管理（使用 vim.plugin.add）
│       ├── treesitter.lua     # 语法高亮
│       ├── telescope.lua      # 模糊查找
│       ├── nvim-tree.lua      # 文件浏览器
│       ├── lsp.lua            # LSP 配置
│       ├── cmp.lua            # 自动补全
│       ├── lualine.lua        # 状态栏
│       └── gitsigns.lua       # Git 集成
```

## 快速开始

### 1. 安装 Neovim 0.12+

```bash
brew install neovim
```

确认版本：
```bash
nvim --version  # 应该显示 0.12 或更高版本
```

### 2. 安装配置

克隆或复制本配置到 `~/.config/nvim/`：

```bash
# 如果还没有配置
git clone <repo-url> ~/.config/nvim

# 或者从备份恢复
cp -r /path/to/backup/nvim ~/.config/nvim
```

### 3. 首次启动

打开 Neovim，原生插件管理器会自动安装所有插件：

```bash
nvim
```

首次启动会自动从 GitHub 克隆所有插件，等待安装完成后重启 Neovim。

### 4. 安装 LSP 服务器

插件会自动安装常用的 LSP 服务器。也可以手动管理：

```vim
:Mason
```

## 插件管理

### Neovim 0.12+ 原生插件管理

本配置使用 Neovim 0.12+ 内置的 `vim.plugin.add()` API，无需任何第三方插件管理器。

### 添加新插件

编辑 `lua/plugins/init.lua`，在 `plugins` 表中添加：

```lua
local plugins = {
  -- 现有插件...
  
  -- 添加新插件
  { url = "https://github.com/作者/插件名" },
}
```

保存后重启 Neovim，插件会自动下载。

### 更新插件

更新所有插件：
```vim
:PluginUpdate
```

### 删除插件

1. 从 `lua/plugins/init.lua` 中移除对应插件配置
2. 手动删除插件目录：
```bash
rm -rf ~/.local/share/nvim/plugin/插件名
```

## 主题切换

配置默认使用深色主题（`github_dark_default`），如需切换到浅色主题：

编辑 `lua/plugins/init.lua`，找到主题配置部分：

```lua
vim.cmd("colorscheme github_dark_default")
```

改为：

```lua
vim.cmd("colorscheme github_light_default")
```

可用主题：
- `github_light_default` - 浅色
- `github_dark_default` - 深色
- `github_light_high_contrast` - 浅色高对比度
- `github_dark_high_contrast` - 深色高对比度

## 常用快捷键

Leader 键：`Space`

### 基础操作
- `<leader>w` - 保存文件
- `<leader>q` - 退出
- `<leader>x` - 保存并退出

### 文件操作
- `<leader>e` - 切换文件浏览器
- `<leader>ff` - 查找文件
- `<leader>fg` - 全局搜索
- `<leader>fb` - 查找 buffer
- `<leader>fr` - 最近文件
- `<leader>fh` - 帮助文档

### Buffer 操作
- `Shift-h` - 上一个 buffer
- `Shift-l` - 下一个 buffer
- `<leader>bd` - 删除 buffer

### 窗口操作
- `Ctrl-h/j/k/l` - 窗口导航
- `<leader>-` - 水平分割
- `<leader>|` - 垂直分割
- `Ctrl-Up/Down/Left/Right` - 调整窗口大小

### LSP 功能
- `gd` - 跳转到定义
- `gD` - 跳转到声明
- `gr` - 查找引用
- `gi` - 跳转到实现
- `K` - 显示文档
- `<leader>rn` - 重命名
- `<leader>ca` - 代码操作
- `<leader>f` - 格式化代码
- `[d` / `]d` - 上一个/下一个诊断

### Git 操作
- `]c` - 下一个变更
- `[c` - 上一个变更
- `<leader>hp` - 预览变更
- `<leader>hs` - 暂存变更
- `<leader>hr` - 重置变更
- `<leader>hb` - 显示 blame

### 编辑增强
- `gc` - 切换注释（普通/可视模式）
- `gb` - 切换块注释
- `Alt-j/k` - 移动行
- `<` / `>` - 缩进（可视模式保持选择）
- `Ctrl-d/u` - 向下/上翻半页并居中
- `Esc` - 清除搜索高亮

### 其他
- `<leader>uw` - 切换自动换行
- `<leader>ul` - 切换行号
- `<leader>ur` - 切换相对行号

## 插件列表

- **原生插件管理** - Neovim 0.12+ 内置 `vim.plugin.add()`
- **github-nvim-theme** - Mac 风格主题
- **nvim-tree** - 文件浏览器
- **telescope** - 模糊查找
- **nvim-treesitter** - 语法高亮
- **nvim-lspconfig** - LSP 配置
- **mason.nvim** - LSP 安装器
- **nvim-cmp** - 自动补全
- **lualine** - 状态栏
- **gitsigns** - Git 集成
- **Comment.nvim** - 注释
- **nvim-autopairs** - 自动配对
- **indent-blankline** - 缩进线
- **nvim-notify** - 通知
- **which-key** - 快捷键提示

## 自定义配置

### 修改基础选项

编辑 `lua/config/options.lua`，修改编辑器行为、界面、性能等设置。

### 修改快捷键

编辑 `lua/config/keymaps.lua`，添加或修改键位映射。

### 添加自动命令

编辑 `lua/config/autocmds.lua`，添加自定义的自动命令。

### 修改插件配置

每个插件的详细配置在 `lua/plugins/` 目录下的对应文件中。

## 性能优化

- 使用 Neovim 原生插件管理，启动更快
- TreeSitter 按需解析
- LSP 服务器按文件类型启动
- 启动时间通常 < 50ms

## 故障排查

### 插件未安装

检查插件目录：
```bash
ls ~/.local/share/nvim/plugin/
```

手动克隆插件：
```bash
git clone https://github.com/作者/插件名 ~/.local/share/nvim/plugin/插件名
```

### LSP 不工作

打开 Mason 安装 LSP 服务器：
```vim
:Mason
```

检查 LSP 状态：
```vim
:LspInfo
```

### 检查健康状态

```vim
:checkhealth
```

### TreeSitter 语法高亮问题

更新 TreeSitter 解析器：
```vim
:TSUpdate
```

安装特定语言：
```vim
:TSInstall <language>
```

## 系统要求

- **Neovim >= 0.12.0** （必需，用于原生插件管理）
- Git
- Node.js（用于部分 LSP）
- Python 3（用于部分插件）
- 一个 Nerd Font 字体（用于图标显示）

## 字体推荐

Mac 原生风格推荐字体：
- **SF Mono**（macOS 系统字体，推荐）
- **Menlo**（macOS 系统字体）
- JetBrains Mono Nerd Font
- FiraCode Nerd Font

在终端中设置字体为 Nerd Font 版本以正确显示图标。

## 备份与同步

### 导出配置

```bash
# 复制到备份目录
cp -r ~/.config/nvim /path/to/backup/

# 或者使用 git
cd ~/.config/nvim
git init
git add .
git commit -m "Initial commit"
git remote add origin <your-repo-url>
git push -u origin main
```

### 恢复配置

```bash
# 从备份恢复
cp -r /path/to/backup/nvim ~/.config/

# 或者从 git 克隆
git clone <your-repo-url> ~/.config/nvim
```

## 许可证

MIT
