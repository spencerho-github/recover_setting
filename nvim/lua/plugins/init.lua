-- ============================================================================
-- Neovim 0.12+ 原生插件管理（使用 vim.pack）
-- ============================================================================

-- 定义插件列表
local plugins = {
  -- 主题
  "projekt0n/github-nvim-theme",

  -- 文件浏览
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",

  -- 模糊查找
  "nvim-telescope/telescope.nvim",
  "nvim-lua/plenary.nvim",

  -- 语法高亮
  "nvim-treesitter/nvim-treesitter",

  -- LSP
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  -- 自动补全
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  -- 状态栏
  "nvim-lualine/lualine.nvim",

  -- Git
  "lewis6991/gitsigns.nvim",

  -- 注释
  "numToStr/Comment.nvim",

  -- 自动配对
  "windwp/nvim-autopairs",

  -- 缩进线
  "lukas-reineke/indent-blankline.nvim",

  -- 通知
  "rcarriga/nvim-notify",

  -- 快捷键提示
  "folke/which-key.nvim",
}

-- 使用 vim.pack.add() 添加插件
for _, plugin in ipairs(plugins) do
  vim.pack.add({
    name = plugin:match("([^/]+)$"),
    url = "https://github.com/" .. plugin,
  })
end

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
