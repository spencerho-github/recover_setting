-- ============================================================================
-- Neovim 0.12+ 原生插件管理（使用 vim.pack）
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

  -- LSP
  { name = "nvim-lspconfig", src = "https://github.com/neovim/nvim-lspconfig" },
  { name = "mason.nvim", src = "https://github.com/williamboman/mason.nvim" },
  { name = "mason-lspconfig.nvim", src = "https://github.com/williamboman/mason-lspconfig.nvim" },

  -- 自动补全
  { name = "nvim-cmp", src = "https://github.com/hrsh7th/nvim-cmp" },
  { name = "cmp-nvim-lsp", src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
  { name = "cmp-buffer", src = "https://github.com/hrsh7th/cmp-buffer" },
  { name = "cmp-path", src = "https://github.com/hrsh7th/cmp-path" },
  { name = "LuaSnip", src = "https://github.com/L3MON4D3/LuaSnip" },
  { name = "cmp_luasnip", src = "https://github.com/saadparwaiz1/cmp_luasnip" },

  -- 状态栏
  { name = "lualine.nvim", src = "https://github.com/nvim-lualine/lualine.nvim" },

  -- Git
  { name = "gitsigns.nvim", src = "https://github.com/lewis6991/gitsigns.nvim" },

  -- 注释
  { name = "Comment.nvim", src = "https://github.com/numToStr/Comment.nvim" },

  -- 自动配对
  { name = "nvim-autopairs", src = "https://github.com/windwp/nvim-autopairs" },

  -- 缩进线
  { name = "indent-blankline.nvim", src = "https://github.com/lukas-reineke/indent-blankline.nvim" },

  -- 通知
  { name = "nvim-notify", src = "https://github.com/rcarriga/nvim-notify" },

  -- 快捷键提示
  { name = "which-key.nvim", src = "https://github.com/folke/which-key.nvim" },
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
pcall(require, "plugins.cmp")
pcall(require, "plugins.lualine")
pcall(require, "plugins.gitsigns")

-- Comment.nvim
ok = pcall(require, "Comment")
if ok then
  require("Comment").setup()
end

-- nvim-autopairs
ok = pcall(require, "nvim-autopairs")
if ok then
  require("nvim-autopairs").setup()
end

-- indent-blankline
ok = pcall(require, "ibl")
if ok then
  require("ibl").setup({
    indent = { char = "│" },
    scope = { enabled = false },
  })
end

-- nvim-notify
ok = pcall(require, "notify")
if ok then
  vim.notify = require("notify")
  require("notify").setup({
    background_colour = "#000000",
    timeout = 3000,
  })
end

-- which-key
ok = pcall(require, "which-key")
if ok then
  require("which-key").setup({
    window = {
      border = "single",
    },
  })
end
