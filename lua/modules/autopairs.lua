local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

if package.loaded["cmp"] then
  require("cmp").setup {
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` after select function or method item
    auto_select = true, -- automatically select the first item
  }
end

if package.loaded["nvim-treesitter"] then
  require("nvim-treesitter.configs").setup { autopairs = { enable = true } }
end

autopairs.setup {
  check_ts = true,
  ts_config = {
    lua = { "string" }, -- it will not add pair on that treesitter node
    javascript = { "template_string" },
  },
}
