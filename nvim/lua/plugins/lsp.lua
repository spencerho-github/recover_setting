-- ============================================================================
-- LSP 配置（使用 Neovim 0.11+ 新 API）
-- ============================================================================

-- Mason 自动安装
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "ts_ls",
    "html",
    "cssls",
  },
  automatic_installation = true,
})

-- LSP 按键映射
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "跳转到声明" })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "跳转到定义" })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "显示文档" })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "跳转到实现" })
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "重命名" })
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "代码操作" })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "查找引用" })
  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, { buffer = bufnr, desc = "格式化代码" })
end

-- LSP 能力（使用原生 LSP 能力）
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- 启用 snippets 支持
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- 配置各个 LSP 服务器（使用新的 vim.lsp.config API）
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
  pyright = {},
  ts_ls = {},
  html = {},
  cssls = {},
}

-- 使用新的 vim.lsp.config API
for server, config in pairs(servers) do
  vim.lsp.config(server, vim.tbl_deep_extend("force", {
    on_attach = on_attach,
    capabilities = capabilities,
  }, config))
end

-- 启用所有配置的 LSP 服务器
vim.lsp.enable({
  "lua_ls",
  "pyright",
  "ts_ls",
  "html",
  "cssls",
})

-- 诊断符号
local signs = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- 诊断配置
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
  },
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})
