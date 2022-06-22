local fn = vim.fn
local lsp_path = fn.stdpath "data" .. "/lsp_servers"
local common_on_attach = require "lsp.on_attach"

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return false
end

local util = lspconfig.util

return {
  ansiblels = {},
  -- bashls = {
  --   filetypes = { "bash", "sh", "zsh" },
  -- },
  cssmodules_ls = {
    init_options = {
      camelCase = "dashes",
    },
    on_attach = function(client, bufnr)
      client.resolved_capabilities.goto_definition = false
      common_on_attach(client, bufnr)
    end,
  },
  cssls = {
    on_attach = function(client, bufnr)
      client.resolved_capabilities.goto_definition = false
      common_on_attach(client, bufnr)
    end,
    handlers = {
      ["textDocument/publishDiagnostics"] = false,
    },
  },
  dockerls = {
    filetypes = { "dockerfile" },
    root_dir = util.root_pattern("Dockerfile", "docker-compose.yml"),
  },
  gopls = {
    filetypes = { "go" },
  },
  html = {},
  jsonls = {
    on_attach = function(client, bufnr)
      common_on_attach(client, bufnr)
      client.resolved_capabilities.document_formatting = false
    end,
    settings = {
      json = {
        schemas = {
          {
            fileMatch = { "package.json" },
            url = "https://json.schemastore.org/package.json",
          },
          {
            fileMatch = { "tsconfig.json", "tsconfig.*.json" },
            url = "http://json.schemastore.org/tsconfig",
          },
        },
      },
    },
  },
  pyright = {},
  rnix = {
    on_attach = function(client, bufnr)
      common_on_attach(client, bufnr)
      client.resolved_capabilities.document_formatting = false
    end,
  },
  sumneko_lua = {
    on_attach = function(client, bufnr)
      common_on_attach(client, bufnr)
      client.resolved_capabilities.document_formatting = false
    end,
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = vim.split(package.path, ";"),
        },
        diagnostics = {
          globals = { "awesome", "client", "mp", "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          },
          maxPreload = 10000,
        },
      },
    },
  },
  stylelint_lsp = {
    filetypes = {
      "css",
      "less",
      "scss",
      "sugarss",
      "vue",
      "wxss",
    },
    on_attach = function(client, bufnr)
      common_on_attach(client, bufnr)
      client.resolved_capabilities.document_formatting = false
    end,
  },
  svelte = {},
  tsserver = {
    on_attach = function(client, bufnr)
      common_on_attach(client, bufnr)
      client.resolved_capabilities.document_formatting = false
    end,
  },
  yamlls = {
    schemas = {
      ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "/.gitlab-ci.yml",
      ["https://json.schemastore.org/github-action.json"] = "/.github/actions/*",
      ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
    },
  },
}
