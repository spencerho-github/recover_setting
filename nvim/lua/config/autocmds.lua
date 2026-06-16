-- ============================================================================
-- 自动命令配置
-- ============================================================================

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- 记住上次编辑位置
autocmd("BufReadPost", {
  group = augroup("RestoreCursor", { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- 自动删除行尾空格
autocmd("BufWritePre", {
  group = augroup("TrimWhitespace", { clear = true }),
  pattern = "*",
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

-- 高亮复制的文本
autocmd("TextYankPost", {
  group = augroup("HighlightYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- 自动调整窗口大小
autocmd("VimResized", {
  group = augroup("ResizeWindows", { clear = true }),
  callback = function()
    vim.cmd("wincmd =")
  end,
})

-- 特定文件类型设置
autocmd("FileType", {
  group = augroup("FileTypeSettings", { clear = true }),
  pattern = { "lua", "javascript", "typescript", "json", "yaml" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- 关闭某些文件类型的自动注释
autocmd("FileType", {
  group = augroup("DisableAutoComment", { clear = true }),
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- 检查文件是否在外部被修改
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("CheckExternalChanges", { clear = true }),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})
