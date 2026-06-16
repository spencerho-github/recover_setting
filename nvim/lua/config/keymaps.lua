-- ============================================================================
-- 键位映射配置
-- ============================================================================

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- 保存和退出
keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "保存文件" })
keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "退出" })
keymap.set("n", "<leader>x", "<cmd>wq<cr>", { desc = "保存并退出" })

-- 清除搜索高亮
keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", opts)

-- 窗口导航
keymap.set("n", "<C-h>", "<C-w>h", { desc = "移动到左侧窗口" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "移动到下方窗口" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "移动到上方窗口" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "移动到右侧窗口" })

-- 调整窗口大小
keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- 移动行
keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", opts)
keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", opts)
keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", opts)
keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", opts)

-- 更好的缩进
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- 快速移动
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "向下翻半页并居中" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "向上翻半页并居中" })
keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "Nzzzv", opts)

-- 分割窗口
keymap.set("n", "<leader>-", "<C-w>s", { desc = "水平分割" })
keymap.set("n", "<leader>|", "<C-w>v", { desc = "垂直分割" })

-- Buffer 操作（添加 Tab/Shift-Tab 切换）
keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "下一个 buffer" })
keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "上一个 buffer" })
keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "上一个 buffer" })
keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "下一个 buffer" })
keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "删除 buffer" })

-- 更好的粘贴
keymap.set("v", "p", '"_dP', opts)

-- 快速移动到行首/行尾
keymap.set({ "n", "v" }, "H", "^", opts)
keymap.set({ "n", "v" }, "L", "$", opts)

-- 插入模式快捷键
keymap.set("i", "<C-a>", "<Home>", opts)
keymap.set("i", "<C-e>", "<End>", opts)

-- 快速添加空行
keymap.set("n", "]<Space>", "o<Esc>", { desc = "下方添加空行" })
keymap.set("n", "[<Space>", "O<Esc>", { desc = "上方添加空行" })

-- 切换选项
keymap.set("n", "<leader>uw", "<cmd>set wrap!<cr>", { desc = "切换自动换行" })
keymap.set("n", "<leader>ul", "<cmd>set number!<cr>", { desc = "切换行号" })
keymap.set("n", "<leader>ur", "<cmd>set relativenumber!<cr>", { desc = "切换相对行号" })

-- 插件快捷键
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "文件浏览器" })
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "查找文件" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "全局搜索" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "查找 buffer" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "帮助文档" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "最近文件" })

-- 注释快捷键（Neovim 0.10+ 内置 gc 快捷键，无需额外配置）
-- gc{motion} - 注释/取消注释（如 gcc 注释当前行，gcip 注释段落）
-- Visual 模式下的 gc 也可用
