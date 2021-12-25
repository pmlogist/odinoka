local theme = require "themes.tomorrow.highlight"

local M = {}

M.base16 = {
  base00 = "ffffff", -- #ffffff
  base01 = "e0e0e0", -- #e0e0e0
  base02 = "d6d6d6", -- #d6d6d6
  base03 = "969896", -- #969896
  base04 = "8e908c", -- #8e908c
  base05 = "4d4d4c", -- #4d4d4c
  base06 = "282a2e", -- #282a2e
  base07 = "212121", -- #1d1f21
  base08 = "c82829", -- #c82829
  base09 = "f5871f", -- #f5871f
  base0A = "CCA000", -- #eab700 <- original
  base0B = "718c00", -- #718c00
  base0C = "3e999f", -- #3e999f
  base0D = "4271ae", -- #4271ae
  base0E = "8959a8", -- #8959a8
  base0F = "a3685a", -- #a3685a
}

M.colors = {
  -- UI
  bg = "#F5F5F5",
  fg = "#212121",
  ui = "#EBEBEB",
  statusline_bg = "#ffffff",
  selection = "#F5F5F5",
  scrollbar = "#4271ae",
  line = "#d6d6d6",
  -- Shades
  bg_accent1 = "#EBEBEB",
  bg_accent2 = "#e0e0e0",
  bg_accent3 = "#d6d6d6",
  bg_accent4 = "#969896",
  bg_accent5 = "#8e908c",
  bg_accent6 = "#4d4d4c",
  bg_accent7 = "#282a2e",
  -- Colors -25% saturation
  white = "#e0e0e0",
  black = "#232527",
  red = "#B43C3C",
  orange = "#DA873A",
  yellow = "#CDA71D",
  green = "#647811",
  blue = "#4F72A0",
  cyan = "#498D92",
  purple = "#85629D",
}

M.feline = {
  fg = M.colors.fg,
  bg = M.colors.bg,
  black = M.colors.black,
  skyblue = "#50B0F0",
  cyan = M.colors.cyan,
  green = M.colors.green,
  oceanblue = M.colors.blue,
  magenta = "#C26BDB",
  orange = M.colors.orange,
  red = M.colors.red,
  violet = "#9E93E8",
  white = M.colors.white,
  yellow = M.colors.yellow,
}

M.set_theme = function()
  theme.set_theme(M.base16, M.colors)
end

return M
