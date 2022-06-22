local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return false
end

local sources = {
  null_ls.builtins.formatting.nixfmt,
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.black,
  null_ls.builtins.code_actions.eslint_d.with {},
  null_ls.builtins.diagnostics.eslint_d.with {
    prefer_local = "node_modules/.bin",
    condition = function(utils)
      return utils.root_has_file { ".eslintrc", ".eslintrc.js", ".eslintrc.json" }
    end,
  },
  null_ls.builtins.formatting.prettierd.with {
    prefer_local = "node_modules/.bin",
    -- condition = function(utils)
    --   return utils.root_has_file { ".prettierrc", ".prettierrc.js", ".prettierrc.json" }
    -- end,
  },
  null_ls.builtins.diagnostics.curlylint.with {
    filetypes = { "jinja.html", "htmldjango", "jinja" },
  },
  -- null_ls.builtins.diagnostics.zsh.with {
  --   filetypes = { "sh", "bash", "zsh" },
  -- },
  null_ls.builtins.formatting.shfmt.with {
    filetypes = { "sh", "bash", "zsh" },
  },
}

null_ls.setup { sources = sources }
