-- ============================================================================
-- 原生补全配置（Neovim 0.10+ 内置）
-- ============================================================================
-- Neovim 0.10+ 内置了基础的补全功能
-- 使用 Ctrl-n / Ctrl-p 触发和导航补全
-- LSP 补全会自动集成

-- 补全快捷键映射
vim.keymap.set("i", "<C-n>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-n>"
  else
    return "<C-x><C-o>"
  end
end, { expr = true, desc = "触发补全或下一项" })

vim.keymap.set("i", "<C-p>", "<C-p>", { desc = "上一个补全项" })
vim.keymap.set("i", "<CR>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-y>"
  else
    return "<CR>"
  end
end, { expr = true, desc = "确认补全或换行" })

-- 补全外观
vim.opt.pumheight = 10 -- 补全菜单最大高度

-- 说明：
-- Ctrl-n 或 Ctrl-x Ctrl-o - 触发 LSP 补全
-- Ctrl-n / Ctrl-p - 在补全菜单中导航
-- Enter - 确认选中的补全项
-- Esc - 关闭补全菜单
