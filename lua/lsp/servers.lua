local fn = vim.fn
local lsp_path = fn.stdpath "data" .. "/lsp_servers"
local common_on_attach = require "lsp.on_attach"

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return false
end

local util = lspconfig.util

return {
  ansiblels = {
    cmd = { lsp_path .. "/ansiblels/bin/ansible-language-server", "--stdio" },
  },
  bashls = {
    cmd = {
      lsp_path .. "/bash/node_modules/.bin/bash-language-server",
      "start",
    },
    filetypes = { "bash", "sh", "zsh" },
  },
  cssmodules_ls = {
    cmd = { lsp_path .. "/cssmodules_ls/node_modules/.bin/cssmodules-language-server" },
    init_options = {
      camelCase = "dashes",
    },
    on_attach = function(client, bufnr)
      client.resolved_capabilities.goto_definition = false
      common_on_attach(client, bufnr)
    end,
  },
  cssls = {
    cmd = {
      "node",
      lsp_path .. "/cssls/node_modules/.bin/vscode-css-language-server",
      "--stdio",
    },
    on_attach = function(client, bufnr)
      client.resolved_capabilities.goto_definition = false
      common_on_attach(client, bufnr)
    end,
    handlers = {
      ["textDocument/publishDiagnostics"] = false,
    },
  },
  dockerls = {
    cmd = { lsp_path .. "/dockerfile/node_modules/.bin/docker-langserver", "--stdio" },
    filetypes = { "dockerfile" },
    root_dir = util.root_pattern("Dockerfile", "docker-compose.yml"),
  },
  gopls = {
    cmd = { lsp_path .. "/go/gopls" },
    filetypes = { "go" },
  },
  html = {
    cmd = {
      "node",
      lsp_path .. "/html/node_modules/.bin/vscode-html-language-server",
      "--stdio",
    },
  },
  jsonls = {
    cmd = {
      "node",
      lsp_path .. "/jsonls/node_modules/.bin/vscode-json-language-server",
      "--stdio",
    },
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

  pyright = {
    cmd = { lsp_path .. "/python/node_modules/.bin/pyright-langserver", "--stdio" },
  },
  rnix = {
    on_attach = function(client, bufnr)
      common_on_attach(client, bufnr)
      client.resolved_capabilities.document_formatting = false
    end,
    cmd = { lsp_path .. "/rnix/bin/rnix-lsp" },
  },
  sumneko_lua = {
    on_attach = function(client, bufnr)
      common_on_attach(client, bufnr)
      client.resolved_capabilities.document_formatting = false
    end,
    cmd = { lsp_path .. "/sumneko_lua/extension/server/bin/lua-language-server" },
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
    cmd = {
      lsp_path .. "/stylelint_lsp/node_modules/.bin/stylelint-lsp",
      "--stdio",
    },
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
  svelte = {
    cmd = { lsp_path .. "/svelte/node_modules/.bin/" .. "svelteserver", "--stdio" },
  },
  tsserver = {
    cmd = { lsp_path .. "/tsserver/node_modules/.bin/typescript-language-server", "--stdio" },
    on_attach = function(client, bufnr)
      common_on_attach(client, bufnr)
      client.resolved_capabilities.document_formatting = false
    end,
  },
  yamlls = {
    cmd = {
      lsp_path .. "/yaml/node_modules/.bin/yaml-language-server",
      "--stdio",
    },
    schemas = {
      ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "/.gitlab-ci.yml",
      ["https://json.schemastore.org/github-action.json"] = "/.github/actions/*",
      ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
    },
  },
}
