local ok, ts_config = pcall(require, "nvim-treesitter.configs")

if not ok then
  return
end

local ensure_installed = {
  "bash",
  "css",
  "dot",
  "go",
  "graphql",
  "java",
  "javascript",
  "json",
  "html",
  "lua",
  "nix",
  "php",
  "python",
  "regex",
  "scss",
  "svelte",
  "typescript",
  "tsx",
  "yaml",
}

ts_config.setup {
  ensure_installed = ensure_installed,
  highlight = {
    enable = true,
    use_languagetree = true,
  },
}
