local theme = require "themes"

local mode_colors = {
  ["n"] = { "NORMAL", "oceanblue" },
  ["no"] = { "N-PENDING", "oceanblue" },
  ["i"] = { "INSERT", "green" },
  ["ic"] = { "INSERT", "green" },
  ["t"] = { "TERMINAL", "green" },
  ["v"] = { "VISUAL", "cyan" },
  ["V"] = { "V-LINE", "cyan" },
  [""] = { "V-BLOCK", "cyan" },
  ["R"] = { "REPLACE", "orange" },
  ["Rv"] = { "V-REPLACE", "orange" },
  ["s"] = { "SELECT", "oceanblue" },
  ["S"] = { "S-LINE", "oceanblue" },
  [""] = { "S-BLOCK", "oceanblue" },
  ["c"] = { "COMMAND", "red" },
  ["cv"] = { "COMMAND", "red" },
  ["ce"] = { "COMMAND", "red" },
  ["r"] = { "PROMPT", "cyan" },
  ["rm"] = { "MORE", "cyan" },
  ["r?"] = { "CONFIRM", "cyan" },
  ["!"] = { "SHELL", "green" },
}

-- Initialize the components table
local components = {
  active = {},
  inactive = {},
}

-- Initialize left, mid and right
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

local mode_hl = function()
  return {
    fg = "white",
    bg = mode_colors[vim.fn.mode()][2],
  }
end

components.active[1][1] = {
  provider = function()
    return " " .. mode_colors[vim.fn.mode()][1] .. " "
  end,
  hl = mode_hl,
}

components.active[1][2] = {
  provider = function()
    local filename = vim.fn.expand "%:t"
    local extension = vim.fn.expand "%:e"
    local icon = require("nvim-web-devicons").get_icon(filename, extension)
    if icon == nil then
      return "  "
    end
    return " " .. icon .. " " .. filename .. " "
  end,
  hl = {
    bg = "white",
  },
  right_sep = {
    str = " ",
  },
}

components.active[1][3] = {
  provider = "git_branch",
  icon = {
    str = " ",
    hl = {
      fg = "orange",
    },
  },
  hl = {
    fg = "black",
  },
}

components.active[2][1] = {
  provider = function()
    local Lsp = vim.lsp.util.get_progress_messages()[1]
    if Lsp then
      local msg = Lsp.message or ""
      local percentage = Lsp.percentage or 0
      local title = Lsp.title or ""
      local spinners = {
        "",
        "",
        "",
      }

      local success_icon = {
        "",
        "",
        "",
      }

      local ms = vim.loop.hrtime() / 1000000
      local frame = math.floor(ms / 120) % #spinners

      if percentage >= 70 then
        return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
      else
        return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
      end
    end
    return ""
  end,
  --enabled = shortline and function(winid)
  --  return vim.api.nvim_win_get_width(winid) > 80
  --end,
  hl = { fg = "green" },
}

components.active[2][2] = {
  provider = "diagnostic_warnings",
  --active = function()
  --  return lsp.diagnostics_exist "Warning"
  --end,
  hl = {
    fg = "yellow",
  },
  icon = "  ",
}

components.active[2][3] = {
  provider = "diagnostic_hints",
  --enabled = function()
  --  return lsp.diagnostics_exist "Hint"
  --end,
  hl = {
    fg = "oceanblue",
  },
  icon = "  ",
}

components.active[2][4] = {
  provider = "diagnostic_info",
  --enabled = function()
  --  return lsp.diagnostics_exist "Information"
  --end,
  hl = {
    fg = "green",
  },
  icon = "  ",
}

components.active[2][5] = {
  provider = "diagnostic_errors",
  hl = {
    fg = "red",
  },
  icon = "  ",
}

components.active[3][1] = {
  provider = "git_diff_added",
  icon = " ",
}

components.active[3][2] = {
  provider = "git_diff_changed",
  icon = "  ",
}

components.active[3][3] = {
  provider = "git_diff_removed",
  icon = "  ",
  right_sep = {
    str = " ",
  },
}

components.active[3][4] = {
  provider = function()
    local current_line = vim.fn.line "."
    local total_line = vim.fn.line "$"

    if current_line == 1 then
      return " Top "
    elseif current_line == vim.fn.line "$" then
      return " Bot "
    end
    local result, _ = math.modf((current_line / total_line) * 100)
    return " " .. result .. "%% "
  end,

  --enabled = shortline or function(winid)
  --  return vim.api.nvim_win_get_width(winid) > 90
  --end,
  hl = mode_hl,
}

require("feline").setup {
  components = components,
  force_inactive = {
    filetypes = {
      "NvimTree",
      "CHAD",
      "packer",
      "dap-repl",
      "dapui_scopes",
      "dapui_stacks",
      "dapui_watches",
      "dapui_repl",
      "LspTrouble",
      "qf",
      "help",
    },
    buftypes = { "terminal" },
    bufnames = {},
  },
  theme = theme.feline,
}
