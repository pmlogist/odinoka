local servers = require "lsp.servers"
local common_on_attach = require "lsp.on_attach"
local common_capabilities = require "lsp.capabilities"

local signs = {
  Error = "",
  Information = "",
  Hint = "",
  Warning = "",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local lsp_publish_diagnostics_options = {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false, -- update diagnostics insert mode
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  lsp_publish_diagnostics_options
)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "single",
})

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return
end

local ok, lspinstaller = pcall(require, "nvim-lsp-installer")
if not ok then
  return
end

lspinstaller.setup {}

for server_name, default_setup in pairs(servers) do
  local setup = default_setup

  if not setup.on_attach then
    setup.on_attach = common_on_attach
  end

  if not setup.capabilities then
    setup.capabilities = common_capabilities(server_name)
  end

  lspconfig[server_name].setup(setup)
end
