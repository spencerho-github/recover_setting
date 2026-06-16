-- ============================================================================
-- Neovim 0.12+ 原生插件管理
-- ============================================================================

-- 定义插件
local plugins = {
  -- 主题
  { url = "https://github.com/projekt0n/github-nvim-theme" },

  -- 文件浏览
  { url = "https://github.com/nvim-tree/nvim-tree.lua" },
  { url = "https://github.com/nvim-tree/nvim-web-devicons" },

  -- 模糊查找
  { url = "https://github.com/nvim-telescope/telescope.nvim" },
  { url = "https://github.com/nvim-lua/plenary.nvim" },

  -- 语法高亮
  { url = "https://github.com/nvim-treesitter/nvim-treesitter" },

  -- LSP
  { url = "https://github.com/neovim/nvim-lspconfig" },
  { url = "https://github.com/williamboman/mason.nvim" },
  { url = "https://github.com/williamboman/mason-lspconfig.nvim" },

  -- 自动补全
  { url = "https://github.com/hrsh7th/nvim-cmp" },
  { url = "https://github.com/hrsh7th/cmp-nvim-lsp" },
  { url = "https://github.com/hrsh7th/cmp-buffer" },
  { url = "https://github.com/hrsh7th/cmp-path" },
  { url = "https://github.com/L3MON4D3/LuaSnip" },
  { url = "https://github.com/saadparwaiz1/cmp_luasnip" },

  -- 状态栏
  { url = "https://github.com/nvim-lualine/lualine.nvim" },

  -- Git
  { url = "https://github.com/lewis6991/gitsigns.nvim" },

  -- 注释
  { url = "https://github.com/numToStr/Comment.nvim" },

  -- 自动配对
  { url = "https://github.com/windwp/nvim-autopairs" },

  -- 缩进线
  { url = "https://github.com/lukas-reineke/indent-blankline.nvim" },

  -- 通知
  { url = "https://github.com/rcarriga/nvim-notify" },

  -- 快捷键提示
  { url = "https://github.com/folke/which-key.nvim" },
}

-- 添加插件
for _, plugin in ipairs(plugins) do
  vim.plugin.add(plugin)
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
