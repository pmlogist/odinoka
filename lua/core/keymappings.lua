local M = {}

local map = require "utils.map"

M.keys = {
  base = {
    close_buffer = "<leader>x",
    buffers = {
      prev = "<S-Tab>",
      next = "<Tab>",
    },
  },
  comment = {
    toggle = "<leader>/",
  },
  chardtree = {
    toggle = "<C-b>",
    focus = "<leader>b",
  },
  telescope = {
    buffers = "<leader>fb",
    find_files = "<leader>ff",
    find_hiddenfiles = "<leader>fa",
    git_commits = "<leader>cm",
    git_status = "<leader>gt",
    help_tags = "<leader>fh",
    live_grep = "<leader>fw",
    oldfiles = "<leader>fo",
  },
  lazygit = {
    toggle = "<leader>gg",
  },
}

vim.g.mapleader = " "

M.base = function()
  local m = M.keys.base

  -- Don't copy the replaced text after pasting in visual mode
  map("v", "p", '"_dP')

  -- Don't yank text on delete ( dd )
  map({ "n", "v" }, "d", '"_d')

  -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
  -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
  -- empty mode is same as using :map
  -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
  map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
  map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
  map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
  map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

  -- use ESC to turn off search highlighting
  map("n", "<Esc>", ":noh <CR>")

  -- Close window + keep slip buffers
  -- https://stackoverflow.com/a/19619038
  map("n", m.close_buffer, ":b#<bar>bd#<CR>")

  map("n", m.buffers.prev, ":bprevious <CR>")
  map("n", m.buffers.next, ":bnext <CR>")
end

M.comment = function()
  local m = M.keys.comment

  map("n", m.toggle, ":CommentToggle <CR>")
  map("v", m.toggle, ":CommentToggle <CR>")
end

M.chadtree = function()
  local m = M.keys.chardtree

  map("n", m.toggle, ":CHADopen <CR>")
  map("n", m.focus, ":CHADopen --always-focus <CR>")
end

M.lazygit = function()
  local m = M.keys.lazygit

  map("n", m.toggle, ":LazyGit <CR>")
end

M.telescope = function()
  local m = M.keys.telescope

  map("n", m.buffers, ":Telescope buffers <CR>")
  map("n", m.find_files, ":Telescope find_files <CR>")
  map("n", m.find_hiddenfiles, ":Telescope find_files hidden=true <CR>")
  map("n", m.git_commits, ":Telescope git_commits <CR>")
  map("n", m.git_status, ":Telescope git_status <CR>")
  map("n", m.help_tags, ":Telescope help_tags <CR>")
  map("n", m.live_grep, ":Telescope live_grep <CR>")
  map("n", m.oldfiles, ":Telescope oldfiles <CR>")
end

return M
