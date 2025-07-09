vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.mouse = 'a'

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true
vim.opt.updatetime = 250
vim.opt.guicursor = ""

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.inccommand = 'split'

local map_set = vim.keymap.set

map_set('n', '<leader>fe', vim.cmd.Ex)
map_set('n', '<C-l>', '<C-w>l')
map_set('n', '<C-k>', '<C-w>k')
map_set('n', '<C-j>', '<C-w>j')
map_set('n', '<C-h>', '<C-w>h')

map_set('n', '<Esc>', '<cmd>nohlsearch<CR>')
map_set('t', '<Esc><Esc>', '<C-\\><C-n>')

map_set('v', "<A-k>", ":m '<-2<CR>gv=gv")
map_set('v', "<A-j>", ":m '>+1<CR>gv=gv")

map_set('n', '<leader>tn', ':tabnew<cr>')
map_set('n', '<leader>bd', ':bdelete<cr>')
map_set('n', '>', ':tabnext<cr>')
map_set('n', '<', ':tabnext<cr>')

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

require('config.lazy')

vim.cmd("colorscheme gruvbox-material")
