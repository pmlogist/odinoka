local fn = vim.fn

local formatter_path = fn.stdpath "data" .. "/formatterinstall"
local node_bin = "/node_modules/.bin"

local black = {
  formatCommand = "black --quiet - ",
  formatStdin = true,
}

local eslint = {
  lintCommand = formatter_path .. node_bin .. "/eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { "%f:%l:%c: %m" },
  formatCommand = formatter_path .. node_bin .. "/eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true,
}

local prettier = {
  formatCommand = formatter_path .. node_bin .. "/prettierd ${INPUT}",
  formatStdin = true,
  --env = {
  --e	string.format(
  --e		"PRETTIERD_DEFAULT_CONFIG=%s",
  --e		vim.fn.expand("~/.config/nvim/utils/linter-config/.prettierrc.json")
  --e	),
  --e},
}

local stylua = {
  formatCommand = "stylua -",
  formatStdin = true,
}

local M = {}

M.languages = {
  css = { prettier },
  lua = { stylua },
  graphql = { prettier },
  html = { prettier },
  json = { prettier },
  javascript = { prettier, eslint },
  javascriptreact = { prettier, eslint },
  markdown = { prettier },
  -- php = {prettier},
  python = { black },
  scss = { prettier },
  typescript = { prettier, eslint },
  typescriptreact = { prettier, eslint },
}

M.efm_log_dir = "/tmp/"

-- Formatting
return M
