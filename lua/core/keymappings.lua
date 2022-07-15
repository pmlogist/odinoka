local M = {}

vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

M.base = function()
  -- Don't copy the replaced text after pasting in visual mode
  vim.keymap.set("v", "p", '"_dP')
  -- Don't yank text on delete ( dd )
  vim.keymap.set({ "n", "v" }, "d", '"_d')

  -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
  -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
  -- empty mode is same as using :map
  -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
  vim.keymap.set("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
  vim.keymap.set("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
  vim.keymap.set("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
  vim.keymap.set("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
  -- use ESC to turn off search highlighting
  vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>", opts)
  -- Close window + keep slip buffers:  https://stackoverflow.com/a/19619038

  local m = {
    buffers = {
      close = "<leader>x",
      prev = "<S-Tab>",
      next = "<Tab>",
    },
  }

  vim.keymap.set("n", m.buffers.close, "<cmd>b#<bar>bd#<cr>", opts)
  vim.keymap.set("n", m.buffers.prev, "<cmd>bprevious<cr>", opts)
  vim.keymap.set("n", m.buffers.next, "<cmd>bnext<cr>", opts)
end

M.comment = function()
  local m = {
    toggle = "<leader>/",
  }

  vim.keymap.set("n", m.toggle, "<cmd>CommentToggle<cr>", opts)
  vim.keymap.set("v", m.toggle, "<cmd>CommentToggle<cr>", opts)
end

M.chadtree = function()
  local m = {
    toggle = "<C-b>",
    focus = "<leader>b",
  }

  vim.keymap.set("n", m.toggle, "<cmd>CHADopen<cr>", opts)
  vim.keymap.set("n", m.focus, "<cmd>CHADopen --always-focus<cr>", opts)
end

M.lazygit = function()
  local m = {
    toggle = "<leader>gg",
  }

  vim.keymap.set("n", m.toggle, "<cmd>LazyGit<cr>", opts)
end

M.telescope = function()
  local m = {
    buffers = "<leader>fb",
    find_files = "<leader>ff",
    find_hiddenfiles = "<leader>fa",
    diagnostics = "<leader>dl",
    git_commits = "<leader>fc",
    git_status = "<leader>fs",
    help_tags = "<leader>fh",
    live_grep = "<leader>fw",
    oldfiles = "<leader>fo",
  }

  vim.keymap.set("n", m.buffers, "<cmd>Telescope buffers<cr>", opts)
  vim.keymap.set("n", m.find_files, "<cmd>Telescope find_files<cr>", opts)
  vim.keymap.set("n", m.find_hiddenfiles, "<cmd>Telescope find_hiddenfiles<cr>", opts)
  vim.keymap.set("n", m.diagnostics, "<cmd>Telescope diagnostics<cr>", opts)
  vim.keymap.set("n", m.git_commits, "<cmd>Telescope git_commits<cr>", opts)
  vim.keymap.set("n", m.git_status, "<cmd>Telescope git_status<cr>", opts)
  vim.keymap.set("n", m.help_tags, "<cmd>Telescope help_tags<cr>", opts)
  vim.keymap.set("n", m.live_grep, "<cmd>Telescope live_grep<cr>", opts)
  vim.keymap.set("n", m.oldfiles, "<cmd>Telescope oldfiles<cr>", opts)
end

return M
