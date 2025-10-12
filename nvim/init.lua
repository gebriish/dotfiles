vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false

vim.schedule(function()
	vim.o.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true
vim.opt.updatetime = 250
vim.opt.guicursor = ''

vim.opt.foldmethod = 'expr'
--vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.inccommand = 'split'

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'netrw',
	callback = function()
		vim.opt_local.number = true
		vim.opt_local.relativenumber = true
	end,
})

local keymap_set = vim.keymap.set

keymap_set('n', '<leader>fe', vim.cmd.Ex)
keymap_set('n', '<C-l>', '<C-w>l')
keymap_set('n', '<C-k>', '<C-w>k')
keymap_set('n', '<C-j>', '<C-w>j')
keymap_set('n', '<C-h>', '<C-w>h')

keymap_set('n', '<C-d>', '<C-d>zz')
keymap_set('n', '<C-u>', '<C-u>zz')

keymap_set('n', '<Esc>', '<cmd>nohlsearch<CR>')
keymap_set('t', '<Esc><Esc>', '<C-\\><C-n>')

keymap_set('v', "<A-k>", ":m '<-2<CR>gv=gv")
keymap_set('v', "<A-j>", ":m '>+1<CR>gv=gv")

keymap_set('n', '<leader>tn', ':tabnew<cr>')
keymap_set('n', '<leader>x', ':tabclose<cr>')
keymap_set('n', '>', ':tabnext<cr>')
keymap_set('n', '<', ':tabprev<cr>')

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

require("config.lazy")

vim.cmd('colorscheme gruvbox-material')
