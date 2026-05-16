vim.cmd("hi clear")
vim.o.background = "dark"
vim.g.colors_name = "gebtheme"

local c = {
	-- Base
	bg         = "#0F1919",
	bg_alt     = "#102121",
	bg_high    = "#0D2525",

	-- Foreground
	fg         = "#BFB7AB",
	fg_soft    = "#8F939A",
	fg_dark    = "#3E4451",

	-- Accent palette
	func       = "#B6AB8B",
	types      = "#65838E",
	constant   = "#A06057",
	error      = "#B56A62",

	accent     = "#7A9E9F",
	accent2    = "#89AFAF",

	cursor     = "#C7BEAF",

	green      = "#6F9F6B",
	yellow     = "#C2AE72",
	orange     = "#B98B68",
	pink       = "#B08AA0",
}

local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

hi("Normal",        { fg = c.fg, bg = c.bg })
hi("NormalFloat",   { fg = c.fg, bg = c.bg_alt })

hi("CursorLine",    { bg = c.bg_alt })
hi("CursorColumn",  { bg = c.bg_alt })

hi("LineNr",        { fg = c.fg_dark })
hi("CursorLineNr",  { fg = c.func, bold = true })

hi("VertSplit",     { fg = c.bg_high })
hi("WinSeparator",  { fg = c.bg_high })

hi("Visual",        { bg = "#1C3434" })

hi("Search",        { fg = c.bg, bg = c.constant })
hi("IncSearch",     { fg = c.bg, bg = c.orange })

hi("ColorColumn",   { bg = c.bg_alt })

hi("Cursor",        { fg = c.bg, bg = c.cursor })

hi("StatusLine",    { fg = c.fg, bg = c.bg_high })
hi("StatusLineNC",  { fg = c.fg_dark, bg = c.bg_alt })

hi("Comment",       { fg = c.green, italic = true })

hi("Keyword",       { fg = c.fg_soft })
hi("Conditional",   { fg = c.fg_soft })
hi("Repeat",        { fg = c.fg_soft })

hi("Identifier",    { fg = c.fg })
hi("Function",      { fg = c.func })

hi("Type",          { fg = c.types })
hi("Structure",     { fg = c.types })

hi("String",        { fg = c.constant })
hi("Character",     { fg = c.constant })

hi("Number",        { fg = c.pink })
hi("Boolean",       { fg = c.pink })
hi("Float",         { fg = c.pink })

hi("Constant",      { fg = c.constant })

hi("Operator",      { fg = c.fg })
hi("Delimiter",     { fg = c.fg_soft })

hi("PreProc",       { fg = c.yellow })
hi("Include",       { fg = c.yellow })

hi("Error",         { fg = c.error, bold = true })
hi("ErrorMsg",      { fg = c.error })

hi("WarningMsg",    { fg = c.yellow })

hi("Todo",          { fg = c.orange, bold = true })

hi("Pmenu",         { fg = c.fg, bg = c.bg_alt })
hi("PmenuSel",      { fg = c.bg, bg = c.func })

hi("PmenuSbar",     { bg = c.bg_high })
hi("PmenuThumb",    { bg = c.fg_dark })

hi("FloatBorder",   { fg = c.bg_high, bg = c.bg_alt })
hi("FloatTitle",    { fg = c.func })

hi("MatchParen",    { fg = c.func, bg = "#243535", bold = true })

hi("NonText",       { fg = c.fg_dark })
hi("SpecialKey",    { fg = c.fg_dark })

hi("DiagnosticError",          { fg = c.error })
hi("DiagnosticWarn",           { fg = c.yellow })
hi("DiagnosticInfo",           { fg = c.accent2 })
hi("DiagnosticHint",           { fg = c.accent })

hi("DiagnosticSignError",      { fg = c.error, bg = c.bg })
hi("DiagnosticSignWarn",       { fg = c.yellow, bg = c.bg })
hi("DiagnosticSignInfo",       { fg = c.accent2, bg = c.bg })
hi("DiagnosticSignHint",       { fg = c.accent, bg = c.bg })

hi("DiagnosticUnderlineError", { undercurl = true, sp = c.error })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.yellow })
hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.accent2 })
hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.accent })

hi("DiffAdd",       { bg = "#1A2A1A" })
hi("DiffChange",    { bg = "#1F262F" })
hi("DiffDelete",    { bg = "#2A1A1A" })
hi("DiffText",      { bg = "#2A3434" })
