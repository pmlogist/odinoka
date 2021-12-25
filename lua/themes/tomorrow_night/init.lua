local theme = require "themes.tomorrow_night.highlight"

local M = {}

M.base16 = {
  base00 = "212121", --#1d1f21
  base01 = "282a2e", --#282a2e
  base02 = "373b41", --#373b41
  base03 = "969896", --#969896
  base04 = "b4b7b4", --#b4b7b4
  base05 = "c5c8c6", --#c5c8c6
  base06 = "e0e0e0", --#e0e0e0
  base07 = "ffffff", --#ffffff
  base08 = "cc6666", --#cc6666
  base09 = "de935f", --#de935f
  base0A = "f0c674", --#f0c674
  base0B = "b5bd68", --#b5bd68
  base0C = "8abeb7", --#8abeb7
  base0D = "81a2be", --#81a2be
  base0E = "b294bb", --#b294bb
  base0F = "a3685a", --#a3685a
}

M.colors = {
  -- UI
  ui = "#191b1d",
  bg = "#212121",
  fg = "#434547",
  line = "#27292b",
  statusline_fg = "#e0e0e0",
  statusline_bg = "#212121",
  -- Shades
  bg_accent1 = "#30343c",
  bg_accent2 = "#353b45",
  bg_accent3 = "#363a41",
  bg_accent4 = "#434547",
  bg_accent5 = "#545B68",
  bg_accent6 = "#616875",
  bg_accent7 = "#676e7b",
  -- Colors
  white = "#C5C8C2",
  black = "#232527",
  red = "#cc6666",
  green = "#a4b595",
  vibrant_green = "#a3b991",
  blue = "#6f8dab",
  blue_dark = "#728da8",
  yellow = "#d7bd8d",
  purple = "#b4bbc8",
  dark_purple = "#b290ac",
  teal = "#8abdb6",
  orange = "#DE935F",
  cyan = "#70c0b1",
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
