-- ============================================================================
-- Gitsigns 配置
-- ============================================================================

require("gitsigns").setup({
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "┆" },
  },
  signcolumn = true,
  numhl = false,
  linehl = false,
  word_diff = false,
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",
    delay = 1000,
    ignore_whitespace = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  max_file_length = 40000,
  preview_config = {
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "]c", function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return "<Ignore>"
    end, { expr = true, desc = "下一个 Git 变更" })

    map("n", "[c", function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return "<Ignore>"
    end, { expr = true, desc = "上一个 Git 变更" })

    -- Actions
    map("n", "<leader>hs", gs.stage_hunk, { desc = "暂存变更" })
    map("n", "<leader>hr", gs.reset_hunk, { desc = "重置变更" })
    map("v", "<leader>hs", function()
      gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "暂存选中变更" })
    map("v", "<leader>hr", function()
      gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "重置选中变更" })
    map("n", "<leader>hS", gs.stage_buffer, { desc = "暂存整个文件" })
    map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "撤销暂存" })
    map("n", "<leader>hR", gs.reset_buffer, { desc = "重置整个文件" })
    map("n", "<leader>hp", gs.preview_hunk, { desc = "预览变更" })
    map("n", "<leader>hb", function()
      gs.blame_line({ full = true })
    end, { desc = "显示 blame" })
    map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "切换行 blame" })
    map("n", "<leader>hd", gs.diffthis, { desc = "显示差异" })
    map("n", "<leader>hD", function()
      gs.diffthis("~")
    end, { desc = "显示差异（HEAD）" })
    map("n", "<leader>td", gs.toggle_deleted, { desc = "切换显示已删除" })

    -- Text object
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "选择变更块" })
  end,
})
