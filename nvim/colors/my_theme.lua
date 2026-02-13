vim.o.background = "dark"
vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.g.colors_name = "handmade-hero"

local C = {
	none = "none",
	back = "#131313",
	margin = "#262626",
	margin_hover = "#333333",
	margin_active = "#404040",
	highlight_cursor_line = "#121E12",
	highlight = "#703419",
	mark = "#808080",
	text_default ="#b69e7f",
	at_highlight = "#ACD7DD",
	comment = "#7D7D7D",
	keyword = "#DBB316",
	str_constant = "#627e28",
	include = "#627e28",
	preproc = "#DAB98F",
	special_character = "#FF0000",
	ghost_character = "#4D5B3C",
	paste = "#FFBB00",
	undo = "#80005D",
	highlight_junk = "#A18430",
	highlight_white = "#003A3A",
	bar = "#262329",
	bar_active = "#A8A8A8",
	base = "#c09f54",
	pop1 = "#262329",
	pop2 = "#A18439",
	line_numbers_back = "#202020",
	line_numbers_text = "#484848",
	type = "#A18439",
	functionh = "#d86c48",
	macro = "#456E67",
	coder_command = "#FFFFFF",
	operator = "#C8964B",
	operator_alt = "#ff5555",
	blue = "#8196aa",
}

C.at_cursor = C.back

C.diff = {
	add = "#26332c",
	change = "#273842",
	delete = "#572E33",
	text = "#314753",
}

local function hi(group, fg, bg, opts)
	opts = opts or {}
	local cmd = "highlight " .. group
	if fg then cmd = cmd .. " guifg=" .. fg end
	if bg then cmd = cmd .. " guibg=" .. bg end
	if opts.bold then cmd = cmd .. " gui=bold" end
	if opts.italic then cmd = cmd .. " gui=italic" end
	vim.cmd(cmd)
end

hi("Normal",       C.text_default, C.back)
hi("NormalFloat",  C.text_default, C.pop1)
hi("LineNr",       C.line_numbers_text, C.line_numbers_back)
hi("CursorLine",   nil, C.highlight_cursor_line)
hi("CursorLineNr", C.base, C.highlight_cursor_line, { bold = true })
hi("Visual",       nil, C.highlight)
hi("Search",       C.back, C.keyword)
hi("IncSearch",    C.back, C.base)
hi("StatusLine",   C.text_default, C.bar)
hi("StatusLineNC", C.comment, C.bar)
hi("VertSplit",    C.margin, C.back)
hi("WinSeparator", C.margin, C.back)

hi("Comment",   C.comment, nil, { italic = true })
hi("Keyword",   C.keyword)
hi("String",    C.str_constant)
hi("Function",  C.functionh)
hi("Type",      C.type)

hi("Macro",     C.macro)
hi("Constant",  C.str_constant)
hi("Operator",  C.operator)
hi("PreProc",   C.preproc)
hi("Include",   C.include)
hi("Identifier",C.text_default)
hi("Special",   C.special_character)

hi("@comment",  C.comment, nil, { italic = true })
hi("@keyword",  C.keyword)
hi("@string",   C.str_constant)
hi("@function", C.functionh)
hi("@type.builtin", C.type)
hi("@type", C.type)
hi("@macro",    C.macro)
hi("@operator", C.operator)
hi("@constant", C.str_constant)
hi("@variable", C.text_default)
hi("@field",    C.blue)
hi("@property", C.blue)
hi("@parameter",C.text_default)

hi("DiagnosticError", C.operator_alt)
hi("DiagnosticWarn",  C.keyword)
hi("DiagnosticInfo",  C.blue)
hi("DiagnosticHint",  C.type)

hi("DiagnosticUnderlineError", C.operator_alt, nil, { underline = true })
hi("DiagnosticUnderlineWarn",  C.keyword, nil, { underline = true })

hi("DiffAdd",    nil, C.diff.add)
hi("DiffChange", nil, C.diff.change)
hi("DiffDelete", nil, C.diff.delete)
hi("DiffText",   nil, C.diff.text)

hi("GitSignsAdd",    C.diff.add)
hi("GitSignsChange", C.diff.change)
hi("GitSignsDelete", C.diff.delete)

hi("Pmenu",      C.text_default, C.pop1)
hi("PmenuSel",   C.back, C.base)
hi("MatchParen", C.at_highlight, C.highlight_white, { bold = true })
hi("Cursor",     C.at_cursor, C.text_default)
hi("Whitespace", C.ghost_character)


hi("@lsp.type.macro", C.macro)
hi("@constant.macro", C.macro)
hi("@function.macro", C.macro)
