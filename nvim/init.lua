-- ============================================================================
-- nvim-lite 配置入口
-- 2026 最小化配置 | Mac 原生风格 | 简洁高效
-- ============================================================================

-- 加载基础配置
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- 加载插件
require("plugins")

-- ============================================================================
-- 2026 配置说明
-- ============================================================================
--
-- 核心插件（7 个）：
-- • telescope          - 模糊查找
-- • nvim-treesitter    - 语法高亮
-- • mason              - LSP 管理
-- • lualine            - 状态栏
-- • gitsigns           - Git 集成
-- • nvim-tree          - 文件浏览
-- • github-theme       - 主题
--
-- 原生功能：
-- • 补全                - Neovim 0.10+ 内置 omnifunc 补全
-- • 注释                - Neovim 0.10+ 内置 gc 快捷键
-- • LSP                 - Neovim 0.12+ 原生 API
-- • 插件管理            - Neovim 0.12+ vim.pack
--
-- 快捷键：
-- <Space>    - Leader 键
-- <Tab>      - 下一个 buffer
-- <S-Tab>    - 上一个 buffer
-- gcc        - 注释/取消注释行（原生）
-- gc{motion} - 注释动作（原生，如 gcip 注释段落）
-- <Space>e   - 文件浏览器
-- <Space>ff  - 查找文件
-- <Space>fg  - 全局搜索
-- gd         - 跳转定义
-- gr         - 查找引用
-- K          - 显示文档
-- <Space>rn  - 重命名
-- <Space>ca  - 代码操作
-- <Space>f   - 格式化
--
-- 补全快捷键：
-- Ctrl-n     - 触发 LSP 补全
-- Ctrl-p     - 上一个补全项
-- Enter      - 确认补全
--
