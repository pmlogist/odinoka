-- https://github.com/NvChad/NvChad/blob/main/lua/colors/highlights.lua
local cmd = vim.cmd

local M = {}

M.highlight = function(group, guifg, guibg, attr, guisp)
  local parts = { group }
  if guifg then
    table.insert(parts, "guifg=#" .. guifg)
  end
  if guibg then
    table.insert(parts, "guibg=#" .. guibg)
  end
  if attr then
    table.insert(parts, "gui=" .. attr)
  end
  if guisp then
    table.insert(parts, "guisp=#" .. guisp)
  end

  -- nvim.ex.highlight(parts)
  vim.api.nvim_command("highlight " .. table.concat(parts, " "))
end

-- Define bg color
-- @param group Group
-- @param color Color
M.bg = function(group, color)
  cmd("hi " .. group .. " guibg=" .. color)
end

-- Define fg color
-- @param group Group
-- @param color Color
M.fg = function(group, color)
  cmd("hi " .. group .. " guifg=" .. color)
end

-- Define bg and fg color
-- @param group Group
-- @param fgcol Fg Color
-- @param bgcol Bg Color
M.fg_bg = function(group, fgcol, bgcol)
  cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

return M
