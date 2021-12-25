local util = require "utils.theming"
local base_highlight = require "themes.tomorrow_night.base_highlight"

local M = {}

M.set_theme = function(theme, colors)
  base_highlight(theme)

  util.fg("EndOfBuffer", colors.bg)
  util.fg("FloatBorder", colors.blue)
  util.bg("NormalFloat", colors.bg_accent3)
  util.fg("StatusLine", "none")
  util.fg("StatusLineNC", "none" .. " gui=NONE")
  util.fg("LineNr", colors.fg)
  util.fg("cursorlinenr", colors.white)
  util.fg("NvimInternalError", colors.red)
  util.fg("VertSplit", colors.bg_accent2)
  -- Pmenu
  util.bg("Pmenu", colors.bg_accent3)
  util.bg("PmenuSbar", colors.bg_accent1)
  util.bg("PmenuSel", colors.green)
  util.bg("PmenuThumb", colors.blue_dark)

  ---
  -- Plugins
  ---

  -- cmp
  util.fg("CmpItemAbbr", colors.white)
  util.fg("CmpItemAbbrMatch", colors.white)
  util.fg("CmpItemKind", colors.teal)
  util.fg("CmpItemMenu", colors.white)

  -- Git Signs
  util.fg_bg("DiffAdd", colors.green, "none")
  util.fg_bg("DiffChange", colors.bg_accent5, "none")
  util.fg_bg("DiffModified", colors.blue_dark, "none")
  util.fg_bg("DiffRemoved", colors.red, "none")
  util.fg_bg("DiffDelete", colors.red, "none")

  --  Indent blankline
  util.fg("IndentBlanklineChar", colors.bg_accent5)

  -- [[ LspDiagnostics

  -- Errors
  util.fg("LspDiagnosticsSignError", colors.red)
  util.fg("LspDiagnosticsSignWarning", colors.yellow)
  util.fg("LspDiagnosticsVirtualTextError", colors.red)
  util.fg("LspDiagnosticsVirtualTextWarning", colors.yellow)

  -- Info
  util.fg("LspDiagnosticsSignInformation", colors.green)
  util.fg("LspDiagnosticsVirtualTextInformation", colors.green)

  -- Hints
  util.fg("LspDiagnosticsSignHint", colors.purple)
  util.fg("LspDiagnosticsVirtualTextHint", colors.purple)

  -- ]]

  -- [[ NvimTree
  util.fg("NvimTreeEmptyFolderName", colors.blue)
  util.fg("NvimTreeEndOfBuffer", colors.ui)
  util.fg("NvimTreeFolderIcon", colors.blue)
  util.fg("NvimTreeFolderName", colors.blue)
  util.fg("NvimTreeGitDirty", colors.red)
  util.fg("NvimTreeIndentMarker", colors.bg_accent2)
  util.bg("NvimTreeNormal", colors.ui)
  util.bg("NvimTreeNormalNC", colors.ui)
  util.fg("NvimTreeOpenedFolderName", colors.blue)
  util.fg("NvimTreeRootFolder", colors.red .. " gui=underline") -- enable underline for root folder in nvim tree
  util.fg_bg("NvimTreeStatuslineNc", colors.ui, colors.ui)
  util.fg("NvimTreeVertSplit", colors.ui)
  util.bg("NvimTreeVertSplit", colors.ui)
  util.fg_bg("NvimTreeWindowPicker", colors.red, colors.black)
  -- ]]

  -- [[ Telescope
  util.fg("TelescopeBorder", colors.bg_accent3)
  util.fg_bg("TelescopePreviewTitle", colors.green, colors.bg_accent3)
  util.fg_bg("TelescopePromptTitle", colors.blue, colors.bg_accent3)
  util.fg_bg("TelescopeResultsTitle", colors.red, colors.bg_accent3)
  -- ]]

  -- TreeSitter

  -- `TSAnnotation`
  -- For C++/Dart attributes, annotations that can be attached to the code to
  -- denote some kind of meta information.
  --
  -- 							      *hl-TSAttribute*
  -- `TSAttribute`
  -- (unstable) TODO: docs
  --
  -- 								*hl-TSBoolean*
  -- `TSBoolean`
  -- For booleans.
  --
  -- 							      *hl-TSCharacter*
  -- `TSCharacter`
  -- For characters.
  --
  -- 								*hl-TSComment*
  -- `TSComment`
  -- For comment blocks.
  --
  -- 							    *hl-TSConditional*
  -- `TSConditional`
  -- For keywords related to conditionnals.
  --
  -- 							       *hl-TSConstant*
  -- `TSConstant`
  -- For constants
  --
  -- 							   *hl-TSConstBuiltin*
  -- `TSConstBuiltin`
  -- For constant that are built in the language: `nil` in Lua.
  --
  -- 							     *hl-TSConstMacro*
  -- `TSConstMacro`
  -- For constants that are defined by macros: `NULL` in C.
  --
  -- 							    *hl-TSConstructor*
  -- `TSConstructor`
  -- For constructor calls and definitions: `{}` in Lua, and Java constructors.
  --
  -- 								  *hl-TSError*
  -- `TSError`
  -- For syntax/parser errors.
  --
  -- 							      *hl-TSException*
  -- `TSException`
  -- For exception related keywords.
  --
  -- 								  *hl-TSField*
  -- `TSField`
  -- For fields.
  --
  -- 								  *hl-TSFloat*
  -- `TSFloat`
  -- For floats.
  --
  -- 							       *hl-TSFunction*
  -- `TSFunction`
  -- For function (calls and definitions).
  --
  -- 							    *hl-TSFuncBuiltin*
  -- `TSFuncBuiltin`
  -- For builtin functions: `table.insert` in Lua.
  --
  -- 							      *hl-TSFuncMacro*
  -- `TSFuncMacro`
  -- For macro defined fuctions (calls and definitions): each `macro_rules` in
  -- Rust.
  --
  -- 								*hl-TSInclude*
  -- `TSInclude`
  -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require`
  -- in Lua.
  --
  -- 								*hl-TSKeyword*
  -- `TSKeyword`
  -- For keywords that don't fall in previous categories.
  --
  -- 							*hl-TSKeywordFunction*
  -- `TSKeywordFunction`
  -- For keywords used to define a fuction.
  --
  -- 							*hl-TSKeywordOperator*
  -- `TSKeywordOperator`
  -- for operators that are English words, e.g. `and`, `as`, `or`.
  --
  -- 							  *hl-TSKeywordReturn*
  -- `TSKeywordReturn`
  -- for the `return` and `yield` keywords.
  --

  -- 								  *hl-TSLabel*
  -- `TSLabel`
  -- For labels: `label:` in C and `:label:` in Lua.
  --
  -- 								 *hl-TSMethod*
  -- `TSMethod`
  -- For method calls and definitions.
  --
  -- 							      *hl-TSNamespace*
  -- `TSNamespace`
  -- For identifiers referring to modules and namespaces.
  --
  -- 								     *hl-None*
  -- `TSNone`
  -- For no highlighting.
  --
  -- 								 *hl-TSNumber*
  -- `TSNumber`
  -- For all numbers
  --
  -- 							       *hl-TSOperator*
  -- `TSOperator`
  -- For any operator: `+`, but also `->` and `*` in C.
  --
  -- 							      *hl-TSParameter*
  -- `TSParameter`
  -- For parameters of a function.
  --
  -- 						     *hl-TSParameterReference*
  -- `TSParameterReference`
  -- For references to parameters of a function.
  --
  -- 							       *hl-TSProperty*
  -- `TSProperty`
  -- Same as `TSField`.
  --
  -- 							 *hl-TSPunctDelimiter*
  -- `TSPunctDelimiter`
  -- For delimiters ie: `.`
  --
  -- 							   *hl-TSPunctBracket*
  -- `TSPunctBracket`
  -- For brackets and parens.
  --
  -- 							   *hl-TSPunctSpecial*
  -- `TSPunctSpecial`
  -- For special punctutation that does not fall in the catagories before.
  --
  -- 								 *hl-TSRepeat*
  -- `TSRepeat`
  -- For keywords related to loops.
  --
  -- 								 *hl-TSString*
  -- `TSString`
  -- For strings.
  --
  -- 							    *hl-TSStringRegex*
  -- `TSStringRegex`
  -- For regexes.
  --
  -- 							   *hl-TSStringEscape*
  -- `TSStringEscape`
  -- For escape characters within a string.
  --
  -- 							  *hl-TSStringSpecial*
  -- `TSStringSpecial`
  -- For strings with special meaning that don't fit into the above categories.
  --
  -- 								 *hl-TSSymbol*
  -- `TSSymbol`
  -- For identifiers referring to symbols or atoms.
  --
  -- 								    *hl-TSTag*
  -- `TSTag`

  -- Tags like html tag names.
  --
  -- 							   *hl-TSTagAttribute*
  -- `TSTagAttribute`
  -- For html tag attributes.

  --
  -- 							   *hl-TSTagDelimiter*
  -- `TSTagDelimiter`
  -- Tag delimiter like `<` `>` `/`
  --
  -- 								   *hl-TSText*
  -- `TSText`
  -- For strings considecolors.red text in a markup language.
  --
  -- 								 *hl-TSSTrong*
  -- `TSStrong`
  -- For text to be represented in bold.
  --
  -- 							       *hl-TSEmphasis*
  -- `TSEmphasis`
  -- For text to be represented with emphasis.
  --
  -- 							      *hl-TSUnderline*
  -- `TSUnderline`
  -- For text to be represented with an underline.
  --
  -- 								 *hl-TSStrike*
  -- `TSStrike`
  -- For strikethrough text.
  --
  -- 								  *hl-TSTitle*
  -- `TSTitle`
  -- Text that is part of a title.
  --
  -- 								*hl-TSLiteral*
  -- `TSLiteral`
  -- Literal text.
  --
  -- 								    *hl-TSURI*
  -- `TSURI`
  -- Any URI like a link or email.
  --
  -- 								   *hl-TSMath*
  -- `TSMath`
  -- For LaTex-like math environments.
  --
  -- 							  *hl-TSTextReference*
  -- `TSTextReference`
  -- For footnotes, text references, citations.
  --
  -- 							     *hl-TSEnvironment*
  -- `TSEnvironment`
  -- For text environments of markup languages.
  --
  -- 							 *hl-TSEnvironmentName*
  -- `TSEnvironmentName`
  -- For the name/the string indicating the type of text environment.
  --
  -- 								   *hl-TSNote*
  -- `TSNote`
  -- Text representation of an informational note.
  --
  -- 								   *TSWarning*
  -- `TSWarning`
  -- Text representation of a warning note.
  --
  -- 								    *TSDanger*
  -- `TSDanger`
  -- Text representation of a danger note.
  --
  -- 								   *hl-TSType*
  -- `TSType`
  -- For types.
  --
  -- 							    *hl-TSTypeBuiltin*
  -- `TSTypeBuiltin`
  -- For builtin types.
  --
  -- 							       *hl-TSVariable*
  -- `TSVariable`
  -- Any variable name that does not have another highlight.
  --
  -- 							*hl-TSVariableBuiltin*
  -- `TSVariableBuiltin`
  -- Variable names that are defined by the languages, like `this` or `self`.
end

return M
