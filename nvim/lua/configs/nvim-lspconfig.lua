for _, diag in ipairs({ "Error", "Warn", "Info", "Hint" }) do
  vim.fn.sign_define("DiagnosticSign" .. diag, {
    text = "",
    texthl = "DiagnosticSign" .. diag,
    linehl = "",
    numhl = "DiagnosticSign" .. diag,
  })
end

vim.o.updatetime = 250
vim.diagnostic.config({
  virtual_text = false,
})
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  buffer = bufnr,
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
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "basedpyright" },
  automatic_installtion = true,
})
--local lspconfig = require("lspconfig")
--lspconfig.basedpyright.setup({
--    capabilities = capabilities,
--    basedpyright = {
--        analysis = {
--            typeCheckingMode = "off",
--        },
--    },
--})
local mason_lspconfig = require "mason-lspconfig"
mason_lspconfig.setup {
  ensure_installed = { "pyright" }
}
require("lspconfig").pyright.setup {
  capabilities = capabilities,
}
