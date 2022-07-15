local ok, packer = pcall(require, "core.packer")

if not ok then
  return false
end

return packer.startup(function()
  local use = packer.use
  local modules = G.modules

  use {
    "wbthomason/packer.nvim",
    event = "VimEnter",
  }

  use {
    "nvim-lua/plenary.nvim",
  }
  use {
    "nvim-lua/popup.nvim",
  }

  use {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("gitsigns").setup()
    end,
  }

  use {
    "terrortylor/nvim-comment",
    disable = not modules.comment.enable,
    cmd = "CommentToggle",
    config = function()
      require "modules.comment"
    end,
    setup = function()
      require("core.keymappings").comment()
    end,
  }

  use {
    "norcalli/nvim-colorizer.lua",
    disable = not modules.colorizer.enable,
    event = "BufRead",
    config = function()
      require "modules.colorizer"
    end,
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    disable = not modules.treesitter.enable,
    branch = "0.5-compat",
    event = "BufRead",
    config = function()
      require "modules.treesitter"
    end,
  }

  ---- LSP
  use {
    "neovim/nvim-lspconfig",
    disable = not modules.lsp.enable,
    opt = true,
    event = "BufReadPre",
    config = function()
      require "lsp"
    end,
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    disable = not modules.lsp.enable,
    config = function()
      require "modules.null-ls"
    end,
    requires = { "nvim-lua/plenary.nvim" },
  }

  use {
    "williamboman/nvim-lsp-installer",
    disable = not modules.lsp.enable,
    requires = { "neovim/nvim-lspconfig" },
  }

  use {
    "nvim-telescope/telescope.nvim",
    module = "telescope",
    cmd = "Telescope",
    requires = {
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = function()
      require "modules.telescope"
    end,
    setup = function()
      require("core.keymappings").telescope()
    end,
  }
  use {
    "stevearc/dressing.nvim",
    disable = not modules.dressing.enable,

    config = function()
      require "modules.dressing"
    end,
  }

  use {
    "rafamadriz/friendly-snippets",
    disable = not modules.cmp.enable,
    event = "InsertEnter",
  }

  use {
    "hrsh7th/nvim-cmp",
    module = "cmp",
    disable = not modules.cmp.enable,
    after = "friendly-snippets",
    config = function()
      require "modules.cmp"
    end,
  }

  use {
    "hrsh7th/vim-vsnip",
    wants = "friendly-snippets",
    after = "nvim-cmp",
  }

  use {
    "hrsh7th/cmp-vsnip",
    disable = not modules.cmp.enable,
    after = "vim-vsnip",
  }

  use {
    "hrsh7th/cmp-nvim-lua",
    disable = not modules.cmp.enable,
    after = "cmp-vsnip",
  }

  use {
    "hrsh7th/cmp-nvim-lsp",
    disable = not modules.lsp.enable,
    module = "cmp_nvim_lsp",
    after = "nvim-lspconfig",
  }

  use {
    "hrsh7th/cmp-buffer",
    disable = not modules.cmp.enable,
    after = "cmp-nvim-lsp",
  }

  use {
    "hrsh7th/cmp-path",
    disable = not modules.cmp.enable,
    after = "cmp-buffer",
  }

  use {
    "windwp/nvim-autopairs",
    disable = not modules.autopairs.enable,
    after = "nvim-cmp",
    config = function()
      require "modules.autopairs"
    end,
  }

  use {
    "windwp/nvim-ts-autotag",
    disable = not modules.cmp.enable,
    after = "nvim-treesitter",
    config = function()
      require "modules.autotag"
    end,
  }

  use {
    "onsails/lspkind-nvim",
    disable = not modules.cmp.enable,
    after = "nvim-cmp",
  }

  use {
    "editorconfig/editorconfig-vim",
  }

  use {
    "ms-jpq/chadtree",
    disable = not modules.chadtree.enable,
    branch = "chad",
    run = "python3 -m chadtree deps",
    setup = function()
      require("core.keymappings").chadtree()
    end,
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    disable = not modules.blankline.enable,
    event = "BufRead",
    config = function()
      require "modules.indent_blankline"
    end,
  }

  use {
    "kyazdani42/nvim-web-devicons",
    disable = not modules.icons.enable,
    config = function()
      require "modules.icons"
    end,
  }

  use {
    "famiu/feline.nvim",
    disable = not modules.feline.enable,
    after = "nvim-web-devicons",
    config = function()
      require "modules.feline"
    end,
  }

  use {
    "kdheepak/lazygit.nvim",
    disable = not modules.lazygit.enable,
    config = function()
      require("core.keymappings").lazygit()
    end,
  }

  use { "Glench/Vim-Jinja2-Syntax" }
end)
