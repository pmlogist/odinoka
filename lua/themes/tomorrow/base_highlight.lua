local util = require "utils.theming"

return function(theme)
  if vim.fn.has "nvim" then
    vim.g.terminal_color_0 = "#" .. theme.base00
    vim.g.terminal_color_1 = "#" .. theme.base08
    vim.g.terminal_color_2 = "#" .. theme.base0B
    vim.g.terminal_color_3 = "#" .. theme.base0A
    vim.g.terminal_color_4 = "#" .. theme.base0D
    vim.g.terminal_color_5 = "#" .. theme.base0E
    vim.g.terminal_color_6 = "#" .. theme.base0C
    vim.g.terminal_color_7 = "#" .. theme.base05
    vim.g.terminal_color_8 = "#" .. theme.base03
    vim.g.terminal_color_9 = "#" .. theme.base08
    vim.g.terminal_color_10 = "#" .. theme.base0B
    vim.g.terminal_color_11 = "#" .. theme.base0A
    vim.g.terminal_color_12 = "#" .. theme.base0D
    vim.g.terminal_color_13 = "#" .. theme.base0E
    vim.g.terminal_color_14 = "#" .. theme.base0C
    vim.g.terminal_color_15 = "#" .. theme.base07
    if vim.o.background == "light" then
      vim.g.terminal_color_background = "#" .. theme.base05
      vim.g.terminal_color_foreground = "#" .. theme.base0B
    else
      vim.g.terminal_color_background = "#" .. theme.base00
      vim.g.terminal_color_foreground = "#" .. theme.base0E
    end
  end
  -- Vim editor colors
  util.highlight("Normal", theme.base05, theme.base00, nil, nil)
  util.highlight("Bold", nil, nil, "bold", nil)
  util.highlight("Debug", theme.base08, nil, nil, nil)
  util.highlight("Directory", theme.base0D, nil, nil, nil)
  util.highlight("Error", theme.base00, theme.base08, nil, nil)
  util.highlight("ErrorMsg", theme.base08, theme.base00, nil, nil)
  util.highlight("Exception", theme.base08, nil, nil, nil)
  util.highlight("FoldColumn", theme.base0C, theme.base01, nil, nil)
  util.highlight("Folded", theme.base03, theme.base01, nil, nil)
  util.highlight("IncSearch", theme.base01, theme.base09, "none", nil)
  util.highlight("Italic", nil, nil, "none", nil)
  util.highlight("Macro", theme.base08, nil, nil, nil)
  util.highlight("MatchParen", nil, theme.base03, nil, nil)
  util.highlight("ModeMsg", theme.base0B, nil, nil, nil)
  util.highlight("MoreMsg", theme.base0B, nil, nil, nil)
  util.highlight("Question", theme.base0D, nil, nil, nil)
  util.highlight("Search", theme.base01, theme.base0A, nil, nil)
  util.highlight("Substitute", theme.base01, theme.base0A, "none", nil)
  util.highlight("SpecialKey", theme.base03, nil, nil, nil)
  util.highlight("TooLong", theme.base08, nil, nil, nil)
  util.highlight("Underlined", theme.base08, nil, nil, nil)
  util.highlight("Visual", nil, theme.base02, nil, nil)
  util.highlight("VisualNOS", theme.base08, nil, nil, nil)
  util.highlight("WarningMsg", theme.base08, nil, nil, nil)
  util.highlight("WildMenu", theme.base08, theme.base0A, nil, nil)
  util.highlight("Title", theme.base0D, nil, "none", nil)
  util.highlight("Conceal", theme.base0D, theme.base00, nil, nil)
  util.highlight("Cursor", theme.base00, theme.base05, nil, nil)
  util.highlight("NonText", theme.base03, nil, nil, nil)
  util.highlight("LineNr", theme.base03, "NONE", nil, nil)
  util.highlight("SignColumn", theme.base03, "NONE", nil, nil)
  util.highlight("StatusLine", theme.base04, "NONE", "none", nil)
  util.highlight("StatusLineNC", theme.base03, "NONE", "none", nil)
  util.highlight("VertSplit", theme.base02, "NONE", "none", nil)
  util.highlight("ColorColumn", nil, theme.base01, "none", nil)
  util.highlight("CursorColumn", nil, theme.base01, "none", nil)
  util.highlight("CursorLine", nil, theme.base01, "none", nil)
  util.highlight("CursorLineNr", theme.base04, "NONE", nil, nil)
  util.highlight("QuickFixLine", nil, theme.base01, "none", nil)
  util.highlight("PMenu", theme.base05, theme.base01, "none", nil)
  util.highlight("PMenuSel", theme.base01, theme.base05, nil, nil)
  util.highlight("TabLine", theme.base03, theme.base01, "none", nil)
  util.highlight("TabLineFill", theme.base03, theme.base01, "none", nil)
  util.highlight("TabLineSel", theme.base0B, theme.base01, "none", nil)

  -- Standard syntax highlighting
  util.highlight("Boolean", theme.base09, nil, nil, nil)
  util.highlight("Character", theme.base08, nil, nil, nil)
  util.highlight("Comment", theme.base03, nil, nil, nil)
  util.highlight("Conditional", theme.base0E, nil, nil, nil)
  util.highlight("Constant", theme.base09, nil, nil, nil)
  util.highlight("Define", theme.base0E, nil, "none", nil)
  util.highlight("Delimiter", theme.base0F, nil, nil, nil)
  util.highlight("Float", theme.base09, nil, nil, nil)
  util.highlight("Function", theme.base0D, nil, nil, nil)
  util.highlight("Identifier", theme.base08, nil, "none", nil)
  util.highlight("Include", theme.base0D, nil, nil, nil)
  util.highlight("Keyword", theme.base0E, nil, nil, nil)
  util.highlight("Label", theme.base0A, nil, nil, nil)
  util.highlight("Number", theme.base09, nil, nil, nil)
  util.highlight("Operator", theme.base05, nil, "none", nil)
  util.highlight("PreProc", theme.base0A, nil, nil, nil)
  util.highlight("Repeat", theme.base0A, nil, nil, nil)
  util.highlight("Special", theme.base0C, nil, nil, nil)
  util.highlight("SpecialChar", theme.base0F, nil, nil, nil)
  util.highlight("Statement", theme.base08, nil, nil, nil)
  util.highlight("StorageClass", theme.base0A, nil, nil, nil)
  util.highlight("String", theme.base0B, nil, nil, nil)
  util.highlight("Structure", theme.base0E, nil, nil, nil)
  util.highlight("Tag", theme.base0A, nil, nil, nil)
  util.highlight("Todo", theme.base0A, theme.base01, nil, nil)
  util.highlight("Type", theme.base0A, nil, "none", nil)
  util.highlight("Typedef", theme.base0A, nil, nil, nil)

  ---
  -- Extra definitions
  ---

  -- C highlighting
  util.highlight("cOperator", theme.base0C, nil, nil, nil)
  util.highlight("cPreCondit", theme.base0E, nil, nil, nil)

  -- C# highlighting
  util.highlight("csClass", theme.base0A, nil, nil, nil)
  util.highlight("csAttribute", theme.base0A, nil, nil, nil)
  util.highlight("csModifier", theme.base0E, nil, nil, nil)
  util.highlight("csType", theme.base08, nil, nil, nil)
  util.highlight("csUnspecifiedStatement", theme.base0D, nil, nil, nil)
  util.highlight("csContextualStatement", theme.base0E, nil, nil, nil)
  util.highlight("csNewDecleration", theme.base08, nil, nil, nil)

  -- CSS highlighting
  util.highlight("cssBraces", theme.base05, nil, nil, nil)
  util.highlight("cssClassName", theme.base0E, nil, nil, nil)
  util.highlight("cssColor", theme.base0C, nil, nil, nil)

  -- Diff highlighting
  util.highlight("DiffAdd", theme.base0B, theme.base01, nil, nil)
  util.highlight("DiffChange", theme.base03, theme.base01, nil, nil)
  util.highlight("DiffDelete", theme.base08, theme.base01, nil, nil)
  util.highlight("DiffText", theme.base0D, theme.base01, nil, nil)
  util.highlight("DiffAdded", theme.base0B, theme.base00, nil, nil)
  util.highlight("DiffFile", theme.base08, theme.base00, nil, nil)
  util.highlight("DiffNewFile", theme.base0B, theme.base00, nil, nil)
  util.highlight("DiffLine", theme.base0D, theme.base00, nil, nil)
  util.highlight("DiffRemoved", theme.base08, theme.base00, nil, nil)

  -- Git highlighting
  util.highlight("gitcommitOverflow", theme.base08, nil, nil, nil)
  util.highlight("gitcommitSummary", theme.base0B, nil, nil, nil)
  util.highlight("gitcommitComment", theme.base03, nil, nil, nil)
  util.highlight("gitcommitUntracked", theme.base03, nil, nil, nil)
  util.highlight("gitcommitDiscarded", theme.base03, nil, nil, nil)
  util.highlight("gitcommitSelected", theme.base03, nil, nil, nil)
  util.highlight("gitcommitHeader", theme.base0E, nil, nil, nil)
  util.highlight("gitcommitSelectedType", theme.base0D, nil, nil, nil)
  util.highlight("gitcommitUnmergedType", theme.base0D, nil, nil, nil)
  util.highlight("gitcommitDiscardedType", theme.base0D, nil, nil, nil)
  util.highlight("gitcommitBranch", theme.base09, nil, "bold", nil)
  util.highlight("gitcommitUntrackedFile", theme.base0A, nil, nil, nil)
  util.highlight("gitcommitUnmergedFile", theme.base08, nil, "bold", nil)
  util.highlight("gitcommitDiscardedFile", theme.base08, nil, "bold", nil)
  util.highlight("gitcommitSelectedFile", theme.base0B, nil, "bold", nil)

  -- HTML highlighting
  util.highlight("htmlBold", theme.base0A, nil, nil, nil)
  util.highlight("htmlItalic", theme.base0E, nil, nil, nil)
  util.highlight("htmlEndTag", theme.base05, nil, nil, nil)
  util.highlight("htmlTag", theme.base05, nil, nil, nil)

  -- JavaScript highlighting
  util.highlight("javaScript", theme.base05, nil, nil, nil)
  util.highlight("javaScriptBraces", theme.base05, nil, nil, nil)
  util.highlight("javaScriptNumber", theme.base09, nil, nil, nil)
  -- pangloss/vim-javascript highlighting
  util.highlight("jsOperator", theme.base0D, nil, nil, nil)
  util.highlight("jsStatement", theme.base0E, nil, nil, nil)
  util.highlight("jsReturn", theme.base0E, nil, nil, nil)
  util.highlight("jsThis", theme.base08, nil, nil, nil)
  util.highlight("jsClassDefinition", theme.base0A, nil, nil, nil)
  util.highlight("jsFunction", theme.base0E, nil, nil, nil)
  util.highlight("jsFuncName", theme.base0D, nil, nil, nil)
  util.highlight("jsFuncCall", theme.base0D, nil, nil, nil)
  util.highlight("jsClassFuncName", theme.base0D, nil, nil, nil)
  util.highlight("jsClassMethodType", theme.base0E, nil, nil, nil)
  util.highlight("jsRegexpString", theme.base0C, nil, nil, nil)
  util.highlight("jsGlobalObjects", theme.base0A, nil, nil, nil)
  util.highlight("jsGlobalNodeObjects", theme.base0A, nil, nil, nil)
  util.highlight("jsExceptions", theme.base0A, nil, nil, nil)
  util.highlight("jsBuiltins", theme.base0A, nil, nil, nil)

  -- Mail highlighting
  util.highlight("mailQuoted1", theme.base0A, nil, nil, nil)
  util.highlight("mailQuoted2", theme.base0B, nil, nil, nil)
  util.highlight("mailQuoted3", theme.base0E, nil, nil, nil)
  util.highlight("mailQuoted4", theme.base0C, nil, nil, nil)
  util.highlight("mailQuoted5", theme.base0D, nil, nil, nil)
  util.highlight("mailQuoted6", theme.base0A, nil, nil, nil)
  util.highlight("mailURL", theme.base0D, nil, nil, nil)
  util.highlight("mailEmail", theme.base0D, nil, nil, nil)

  -- Markdown highlighting
  util.highlight("markdownCode", theme.base0B, nil, nil, nil)
  util.highlight("markdownError", theme.base05, theme.base00, nil, nil)
  util.highlight("markdownCodeBlock", theme.base0B, nil, nil, nil)
  util.highlight("markdownHeadingDelimiter", theme.base0D, nil, nil, nil)

  -- PHP highlighting
  util.highlight("phpMemberSelector", theme.base05, nil, nil, nil)
  util.highlight("phpComparison", theme.base05, nil, nil, nil)
  util.highlight("phpParent", theme.base05, nil, nil, nil)
  util.highlight("phpMethodsVar", theme.base0C, nil, nil, nil)

  -- Python highlighting
  util.highlight("pythonOperator", theme.base0E, nil, nil, nil)
  util.highlight("pythonRepeat", theme.base0E, nil, nil, nil)
  util.highlight("pythonInclude", theme.base0E, nil, nil, nil)
  util.highlight("pythonStatement", theme.base0E, nil, nil, nil)

  -- Ruby highlighting
  util.highlight("rubyAttribute", theme.base0D, nil, nil, nil)
  util.highlight("rubyConstant", theme.base0A, nil, nil, nil)
  util.highlight("rubyInterpolationDelimiter", theme.base0F, nil, nil, nil)
  util.highlight("rubyRegexp", theme.base0C, nil, nil, nil)
  util.highlight("rubySymbol", theme.base0B, nil, nil, nil)
  util.highlight("rubyStringDelimiter", theme.base0B, nil, nil, nil)

  -- SASS highlighting
  util.highlight("sassidChar", theme.base08, nil, nil, nil)
  util.highlight("sassClassChar", theme.base09, nil, nil, nil)
  util.highlight("sassInclude", theme.base0E, nil, nil, nil)
  util.highlight("sassMixing", theme.base0E, nil, nil, nil)
  util.highlight("sassMixinName", theme.base0D, nil, nil, nil)

  -- Spelling highlighting
  util.highlight("SpellBad", nil, nil, "undercurl", theme.base08)
  util.highlight("SpellLocal", nil, nil, "undercurl", theme.base0C)
  util.highlight("SpellCap", nil, nil, "undercurl", theme.base0D)
  util.highlight("SpellRare", nil, nil, "undercurl", theme.base0E)

  -- Java highlighting
  util.highlight("javaOperator", theme.base0D, nil, nil, nil)
end
