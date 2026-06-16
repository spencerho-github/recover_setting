-- ============================================================================
-- Neovim 0.12+ 原生插件管理（使用 vim.pack）
-- ============================================================================

-- 使用 vim.pack.add() 添加插件
vim.pack.add({
  -- 主题
  { name = "github-nvim-theme", url = "https://github.com/projekt0n/github-nvim-theme" },

  -- 文件浏览
  { name = "nvim-tree.lua", url = "https://github.com/nvim-tree/nvim-tree.lua" },
  { name = "nvim-web-devicons", url = "https://github.com/nvim-tree/nvim-web-devicons" },

  -- 模糊查找
  { name = "telescope.nvim", url = "https://github.com/nvim-telescope/telescope.nvim" },
  { name = "plenary.nvim", url = "https://github.com/nvim-lua/plenary.nvim" },

  -- 语法高亮
  { name = "nvim-treesitter", url = "https://github.com/nvim-treesitter/nvim-treesitter" },

  -- LSP
  { name = "nvim-lspconfig", url = "https://github.com/neovim/nvim-lspconfig" },
  { name = "mason.nvim", url = "https://github.com/williamboman/mason.nvim" },
  { name = "mason-lspconfig.nvim", url = "https://github.com/williamboman/mason-lspconfig.nvim" },

  -- 自动补全
  { name = "nvim-cmp", url = "https://github.com/hrsh7th/nvim-cmp" },
  { name = "cmp-nvim-lsp", url = "https://github.com/hrsh7th/cmp-nvim-lsp" },
  { name = "cmp-buffer", url = "https://github.com/hrsh7th/cmp-buffer" },
  { name = "cmp-path", url = "https://github.com/hrsh7th/cmp-path" },
  { name = "LuaSnip", url = "https://github.com/L3MON4D3/LuaSnip" },
  { name = "cmp_luasnip", url = "https://github.com/saadparwaiz1/cmp_luasnip" },

  -- 状态栏
  { name = "lualine.nvim", url = "https://github.com/nvim-lualine/lualine.nvim" },

  -- Git
  { name = "gitsigns.nvim", url = "https://github.com/lewis6991/gitsigns.nvim" },

  -- 注释
  { name = "Comment.nvim", url = "https://github.com/numToStr/Comment.nvim" },

  -- 自动配对
  { name = "nvim-autopairs", url = "https://github.com/windwp/nvim-autopairs" },

  -- 缩进线
  { name = "indent-blankline.nvim", url = "https://github.com/lukas-reineke/indent-blankline.nvim" },

  -- 通知
  { name = "nvim-notify", url = "https://github.com/rcarriga/nvim-notify" },

  -- 快捷键提示
  { name = "which-key.nvim", url = "https://github.com/folke/which-key.nvim" },
})

-- ============================================================================
-- 插件配置
-- ============================================================================

-- 主题配置
require("github-theme").setup({
  options = {
    transparent = false,
    terminal_colors = true,
    dim_inactive = true,
    styles = {
      comments = "italic",
      keywords = "NONE",
      types = "NONE",
      functions = "NONE",
      variables = "NONE",
    },
  },
})
vim.cmd("colorscheme github_dark_default")

-- 加载其他插件配置
require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.lualine")
require("plugins.gitsigns")

-- Comment.nvim
require("Comment").setup()

-- nvim-autopairs
require("nvim-autopairs").setup()

-- indent-blankline
require("ibl").setup({
  indent = { char = "│" },
  scope = { enabled = false },
})

-- nvim-notify
vim.notify = require("notify")
require("notify").setup({
  background_colour = "#000000",
  timeout = 3000,
})

-- which-key
require("which-key").setup({
  window = {
    border = "single",
  },
})
