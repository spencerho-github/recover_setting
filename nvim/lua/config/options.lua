-- ============================================================================
-- 基础选项配置
-- ============================================================================

local opt = vim.opt
local g = vim.g

-- Leader 键
g.mapleader = " "
g.maplocalleader = " "

-- 行号
opt.number = true
opt.relativenumber = false

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- 界面
opt.termguicolors = true
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.colorcolumn = "80"

-- 显示
opt.showmode = false  -- 使用状态栏显示模式
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 3  -- 全局状态栏

-- 分割窗口
opt.splitbelow = true
opt.splitright = true

-- 编辑体验
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.undolevels = 10000
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- 性能
opt.updatetime = 200
opt.timeoutlen = 300
opt.completeopt = "menu,menuone,noselect"

-- 文件编码
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- 自动保存
opt.autowrite = true
opt.autoread = true

-- 折叠
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

-- 命令行补全
opt.wildmode = "longest:full,full"
opt.wildoptions = "pum"

-- 列表字符
opt.list = true
opt.listchars = { tab = "→ ", trail = "·", nbsp = "␣" }

-- 填充字符
opt.fillchars = {
  foldopen = "▾",
  foldclose = "▸",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
