local cmd = vim.cmd
local fn = vim.fn

local ok, packer = pcall(require, "packer")
if ok then
  cmd "packadd packer.nvim"
end

if not ok then
  local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"

  vim.fn.system {
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    "--depth",
    "1",
    install_path,
  }

  cmd "packadd packer.nvim"

  ok, packer = pcall(require, "packer")
  if ok then
    cmd "packadd packer.nvim"
  else
    error("Couldn't clone packer !\nPacker path: " .. install_path .. "\n" .. packer)
  end
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
    prompt_border = "single",
  },
  git = {
    clone_timeout = 600, -- Timeout, in seconds, for git clones
  },
  auto_clean = true,
  compile_on_sync = true,
}

return packer
