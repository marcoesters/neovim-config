local signs = { text = {}, numhl = {} }
for _, diag in ipairs({ "ERROR", "WARN", "INFO", "HINT" }) do
  signs.text[vim.diagnostic.severity[diag]] = ""
  signs.numhl[vim.diagnostic.severity[diag]] = "DiagnosticSign" .. diag:sub(1,1) .. diag:sub(2):lower()
end

vim.diagnostic.config({
  virtual_text = false,
  signs = signs,
})

vim.api.nvim_create_autocmd({ "CursorHold" }, {
  group = vim.api.nvim_create_augroup(
    "float_diagnostic_cursor",
    { clear = true }
  ),
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = "always",
      prefix = " ",
      scope = "cursor",
    }
    vim.diagnostic.open_float(nil, opts)
  end
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local language_servers = {
  "bashls",
  "jsonls",
  "lua_ls",
  "pyright",
  "ts_ls",
  "yamlls",
}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = language_servers,
  automatic_installation = true,
})

local lspconfig = require("lspconfig")
for _, server in ipairs(language_servers) do
  lspconfig[server].setup({})
end
