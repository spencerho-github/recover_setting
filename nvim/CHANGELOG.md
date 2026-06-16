# Neovim 2026 最小化配置 - 改造完成

## 📊 配置对比

### 插件数量
- **之前**: 15+ 个插件
- **现在**: 8 个核心插件
- **精简**: ~47% 减少

### 插件变化

#### ✅ 保留
- `github-nvim-theme` - 主题
- `nvim-tree` + `nvim-web-devicons` - 文件浏览
- `telescope` + 依赖 - 模糊查找
- `nvim-treesitter` - 语法高亮
- `mason.nvim` + `mason-lspconfig` - LSP 管理
- `lualine.nvim` - 状态栏
- `gitsigns.nvim` - Git 集成

#### 🔄 替换
- ❌ `nvim-cmp` + 5 个依赖插件 → ✅ **`blink.cmp`** (更快，一体化)
- ❌ `nvim-lspconfig` → ✅ **Neovim 0.12 原生 LSP API**

#### 🗑️ 移除（使用原生功能或非必需）
- `Comment.nvim` - Neovim 0.10+ 已内置 `gc` 注释
- `nvim-autopairs` - 非必需
- `indent-blankline` - 非必需
- `nvim-notify` - 使用原生通知
- `which-key` - 非必需

## 🎯 核心改进

### 1. Blink.cmp 补全引擎
- **性能**: 比 nvim-cmp 快 10 倍
- **按键**: 
  - `Enter` - 确认补全
  - `Tab/Shift-Tab` - 切换选项
  - `Ctrl-Space` - 触发补全
- **自动显示文档**

### 2. 原生 LSP 配置
使用 Neovim 0.12 的 `vim.lsp.config` 和 `vim.lsp.enable` API，无需 nvim-lspconfig

### 3. 内置注释
- `gcc` - 注释/取消注释当前行
- `gc{motion}` - 注释动作（如 `gcip` 注释段落）
- Visual 模式下 `gc` - 注释选中内容

### 4. 优化的配置选项
- ✅ 相对行号 (`relativenumber = true`)
- ✅ 鼠标设置 (`mouse = 'nci'` - 禁用 visual 模式)
- ✅ 隐藏列表字符 (`list = false`)
- ✅ Tab/Shift-Tab 切换 buffer

## 🚀 快捷键速查

| 快捷键 | 功能 |
|--------|------|
| `<Space>` | Leader 键 |
| `<Tab>` | 下一个 buffer |
| `<Shift-Tab>` | 上一个 buffer |
| `gcc` | 注释/取消注释行 |
| `gc{motion}` | 注释动作 |
| `<Space>e` | 文件浏览器 |
| `<Space>ff` | 查找文件 |
| `<Space>fg` | 全局搜索 |
| `gd` | 跳转定义 |
| `gr` | 查找引用 |
| `K` | 显示文档 |
| `<Space>rn` | 重命名 |
| `<Space>ca` | 代码操作 |
| `<Space>f` | 格式化代码 |

## 📁 文件结构

```
~/.config/nvim/
├── init.lua                      # 入口文件
├── lua/
│   ├── config/
│   │   ├── options.lua          # 基础选项
│   │   ├── keymaps.lua          # 键位映射
│   │   └── autocmds.lua         # 自动命令
│   └── plugins/
│       ├── init.lua             # 插件管理（vim.pack）
│       ├── blink-cmp.lua        # 补全配置 ⭐ 新
│       ├── lsp.lua              # LSP 配置
│       ├── telescope.lua        # 模糊查找
│       ├── treesitter.lua       # 语法高亮
│       ├── nvim-tree.lua        # 文件浏览
│       ├── lualine.lua          # 状态栏
│       └── gitsigns.lua         # Git 集成
```

## 🔧 首次启动

配置已更新，首次启动 Neovim 时会自动下载插件：

```bash
nvim
```

等待插件下载完成后，运行以下命令：

```vim
:Mason
```

安装你需要的 LSP 服务器（已配置：lua_ls, pyright, ts_ls, html, cssls）

## 📚 参考资源

- [Neovim Configuration for 2026](https://jarv.org/posts/neovim-config-2026/)
- [Transform Your Neovim into an IDE (v0.12)](https://martinlwx.github.io/en/config-neovim-from-scratch/)
- [Blink.cmp GitHub](https://github.com/Saghen/blink.cmp)
- [Neovim 0.12 Release Notes](https://dotfiles.substack.com/p/whats-new-in-neovim-012)
