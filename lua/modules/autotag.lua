local ok, autotag = pcall(require, "nvim-ts-autotag")
if not ok then
  return false
end

if package.loaded["nvim-treesitter"] then
  require("nvim-treesitter.configs").setup { autotag = { enable = true } }
end

autotag.setup {}
