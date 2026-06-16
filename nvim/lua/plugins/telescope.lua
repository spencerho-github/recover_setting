-- ============================================================================
-- Telescope 配置
-- ============================================================================

local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "truncate" },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<Esc>"] = actions.close,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

-- 加载扩展
-- 注意：fzf 扩展需要先编译，运行：cd ~/.local/share/nvim/pack/opt/telescope-fzf-native.nvim && make
-- telescope.load_extension("fzf")
