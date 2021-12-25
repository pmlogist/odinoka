local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return false
end

local sources = {
  null_ls.builtins.formatting.nixfmt,
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.prettierd.with {
    disabled_filetypes = { "html" },
  },
}

null_ls.setup { sources = sources }
