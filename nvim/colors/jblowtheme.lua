vim.cmd("hi clear")
vim.o.background = "dark"
vim.g.colors_name = "jblowtheme"

local c = {
	bg        = "#072626",
	bg_alt    = "#1A1A1A",
	fg        = "#D3B58D",
	dim       = "#87919D",

	accent    = "#0FDFAF",
	accent2   = "#33CCCC",

	green     = "#3DDF23",
	lightgreen= "#98FB98",

	yellow    = "#E4D97D",
	orange    = "#E0AD82",
	red       = "#FF0000",
	pink      = "#D699B5",

	cursor    = "#90EE90",
}

local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- UI
hi("Normal",        { fg = c.fg, bg = c.bg })
hi("NormalFloat",   { fg = c.fg, bg = c.bg_alt })
hi("CursorLine",    { bg = "#1A1A1A" })
hi("CursorColumn",  { bg = "#1A1A1A" })
hi("LineNr",        { fg = c.dim })
hi("CursorLineNr",  { fg = c.accent })
hi("VertSplit",     { fg = "#1C4449" })
hi("Visual",        { bg = "#0000FF" })
hi("Search",        { bg = "#CD6889", fg = c.bg })
hi("IncSearch",     { bg = "#CD6889", fg = c.bg })

-- Cursor
hi("Cursor",        { fg = c.bg, bg = c.cursor })

-- Statusline
hi("StatusLine",    { fg = c.bg_alt, bg = c.fg })
hi("StatusLineNC",  { fg = c.dim, bg = c.bg_alt })

-- Syntax
hi("Comment",       { fg = c.green, italic = true })
hi("Keyword",       { fg = "#FFFFFF" })
hi("Identifier",    { fg = c.fg })
hi("Function",      { fg = c.fg })
hi("Type",          { fg = c.lightgreen })
hi("String",        { fg = c.accent })
hi("Number",        { fg = c.pink })
hi("Constant",      { fg = "#7FFFD4" })
hi("Operator",      { fg = c.fg })
hi("Delimiter",     { fg = c.fg })

-- Errors / warnings
hi("Error",         { fg = c.red, bold = true })
hi("WarningMsg",    { fg = c.yellow })
hi("Todo",          { fg = c.orange, bold = true })

-- Popup menu
hi("Pmenu",         { fg = c.fg, bg = c.bg_alt })
hi("PmenuSel",      { fg = c.bg, bg = c.accent })

-- Floating borders
hi("FloatBorder",   { fg = c.accent2 })

-- Indent / match
hi("MatchParen",    { bg = "#FCEDFC", fg = c.bg })

-- Diagnostics
hi("DiagnosticError",            { fg = c.red })
hi("DiagnosticWarn",             { fg = c.yellow })
hi("DiagnosticInfo",             { fg = c.accent2 })
hi("DiagnosticHint",             { fg = c.accent })

hi("DiagnosticSignError",        { fg = c.red, bg = c.bg })
hi("DiagnosticSignWarn",         { fg = c.yellow, bg = c.bg })
hi("DiagnosticSignInfo",         { fg = c.accent2, bg = c.bg })
hi("DiagnosticSignHint",         { fg = c.accent, bg = c.bg })

hi("DiagnosticUnderlineError",   { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn",    { undercurl = true, sp = c.yellow })
hi("DiagnosticUnderlineInfo",    { undercurl = true, sp = c.accent2 })
hi("DiagnosticUnderlineHint",    { undercurl = true, sp = c.accent })
