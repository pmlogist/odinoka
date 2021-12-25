return function(provider)
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  local ok, cmp = pcall(require, "cmp_nvim_lsp")
  if ok and G.modules.cmp.enable then
    capabilities = cmp.update_capabilities(capabilities)
  end

  return capabilities
end
