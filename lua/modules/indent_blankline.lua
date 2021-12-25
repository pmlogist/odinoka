local ok, blankline = pcall(require, "indent_blankline")
if not ok then
  return
end

blankline.setup {
  indentLine_enabled = 1,
  char = "▏",
  filetype_exclude = {
    "help",
    "terminal",
    "dashboard",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "LspInstall",
  },
  buftype_exclude = { "terminal", "nofile" },
  show_trailing_blankline_indent = true,
  show_first_indent_level = false,
  show_current_context = true,
  show_current_context_start = true,
}
