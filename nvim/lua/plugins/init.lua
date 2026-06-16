-- ============================================================================
-- Neovim 0.12+ 原生插件管理（极简配置 - 7 个核心插件）
-- 使用 Neovim 0.12 原生补全，无需额外补全插件
-- ============================================================================

-- 使用 vim.pack.add() 添加插件
vim.pack.add({
  -- 主题
  { name = "github-nvim-theme", src = "https://github.com/projekt0n/github-nvim-theme" },

  -- 文件浏览
  { name = "nvim-tree.lua", src = "https://github.com/nvim-tree/nvim-tree.lua" },
  { name = "nvim-web-devicons", src = "https://github.com/nvim-tree/nvim-web-devicons" },

  -- 模糊查找
  { name = "telescope.nvim", src = "https://github.com/nvim-telescope/telescope.nvim" },
  { name = "telescope-fzf-native.nvim", src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
  { name = "plenary.nvim", src = "https://github.com/nvim-lua/plenary.nvim" },

  -- 语法高亮
  { name = "nvim-treesitter", src = "https://github.com/nvim-treesitter/nvim-treesitter" },

  -- LSP 管理
  { name = "mason.nvim", src = "https://github.com/williamboman/mason.nvim" },
  { name = "mason-lspconfig.nvim", src = "https://github.com/williamboman/mason-lspconfig.nvim" },

  -- 状态栏
  { name = "lualine.nvim", src = "https://github.com/nvim-lualine/lualine.nvim" },

  -- Git 集成
  { name = "gitsigns.nvim", src = "https://github.com/lewis6991/gitsigns.nvim" },
})

-- ============================================================================
-- 插件配置
-- ============================================================================

-- 主题配置
local ok, github_theme = pcall(require, "github-theme")
if ok then
  github_theme.setup({
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
end

-- 加载其他插件配置（使用 pcall 防止插件未安装时报错）
pcall(require, "plugins.nvim-tree")
pcall(require, "plugins.telescope")
pcall(require, "plugins.treesitter")
pcall(require, "plugins.lsp")
pcall(require, "plugins.completion")
pcall(require, "plugins.lualine")
pcall(require, "plugins.gitsigns")
