-- ============================================================================
-- Neovim 原生插件管理（使用 pack 系统）
-- ============================================================================

-- 插件安装路径
local plugin_path = vim.fn.stdpath("data") .. "/site/pack/plugins/start/"

-- 确保插件目录存在
vim.fn.mkdir(plugin_path, "p")

-- 辅助函数：确保插件已安装
local function ensure_plugin(repo, name)
  local install_path = plugin_path .. name
  if vim.fn.isdirectory(install_path) == 0 then
    print("Installing " .. name .. "...")
    vim.fn.system({
      "git",
      "clone",
      "--depth=1",
      "https://github.com/" .. repo,
      install_path,
    })
    vim.cmd("packloadall")
    return true
  end
  return false
end

-- ============================================================================
-- 安装插件
-- ============================================================================

-- 主题
ensure_plugin("projekt0n/github-nvim-theme", "github-nvim-theme")

-- 文件浏览
ensure_plugin("nvim-tree/nvim-tree.lua", "nvim-tree.lua")
ensure_plugin("nvim-tree/nvim-web-devicons", "nvim-web-devicons")

-- 模糊查找
ensure_plugin("nvim-telescope/telescope.nvim", "telescope.nvim")
ensure_plugin("nvim-lua/plenary.nvim", "plenary.nvim")

-- 语法高亮
ensure_plugin("nvim-treesitter/nvim-treesitter", "nvim-treesitter")

-- LSP
ensure_plugin("neovim/nvim-lspconfig", "nvim-lspconfig")
ensure_plugin("williamboman/mason.nvim", "mason.nvim")
ensure_plugin("williamboman/mason-lspconfig.nvim", "mason-lspconfig.nvim")

-- 自动补全
ensure_plugin("hrsh7th/nvim-cmp", "nvim-cmp")
ensure_plugin("hrsh7th/cmp-nvim-lsp", "cmp-nvim-lsp")
ensure_plugin("hrsh7th/cmp-buffer", "cmp-buffer")
ensure_plugin("hrsh7th/cmp-path", "cmp-path")
ensure_plugin("L3MON4D3/LuaSnip", "LuaSnip")
ensure_plugin("saadparwaiz1/cmp_luasnip", "cmp_luasnip")

-- 状态栏
ensure_plugin("nvim-lualine/lualine.nvim", "lualine.nvim")

-- Git
ensure_plugin("lewis6991/gitsigns.nvim", "gitsigns.nvim")

-- 注释
ensure_plugin("numToStr/Comment.nvim", "Comment.nvim")

-- 自动配对
ensure_plugin("windwp/nvim-autopairs", "nvim-autopairs")

-- 缩进线
ensure_plugin("lukas-reineke/indent-blankline.nvim", "indent-blankline.nvim")

-- 通知
ensure_plugin("rcarriga/nvim-notify", "nvim-notify")

-- 快捷键提示
ensure_plugin("folke/which-key.nvim", "which-key.nvim")

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
