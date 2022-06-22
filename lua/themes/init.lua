local isMacOS = vim.fn.has "macunix"

local theme_name = "tomorrow"

--if isMacOS then
--local macos_theme = io.popen("defaults read -g AppleInterfaceStyle", "r"):read():gsub("%'", "")

--print(macos_theme)

--if macos_theme ~= nil then
--  theme_name = "tomorrow_night"
--else
--  theme_name = "tomorrow"
--end
--local gtk_theme = io.popen("dconf read /org/gnome/desktop/interface/gtk-theme", "r"):read():gsub("%'", "")

-- theme_name = "tomorrow_night"
--if gtk_theme ~= "Adwaita-dark" then
--  theme_name = "tomorrow"
--else
theme_name = "tomorrow_night"
--end

local ok, theme = pcall(require, "themes." .. theme_name)
if not ok then
  error "No theme available"
end

local x = {
  tomorrow = require "themes.tomorrow",
  tomorrow_night = require "themes.tomorrow_night",
}

G.theme = {}

for key, value in pairs(x) do
  G.theme[key] = {
    colors = value.colors,
    set = function()
      require("themes." .. key).set_theme()

      if G.modules.feline.enable then
        require("feline").use_theme(value.feline)
        require("feline").reset_highlights()
      end
    end,
  }
end

theme.set_theme()

return theme
