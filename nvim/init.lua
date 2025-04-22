vim.g.leader = ' '
vim.g.mapleader = ' '

require("config.lazy")
require("config.keymaps")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.wrap = false

vim.opt.tabstop		= 2
vim.opt.shiftwidth	= 2
vim.opt.softtabstop = 2
vim.opt.expandtab = false

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 10
vim.opt.cursorline = true

vim.g.gruvbox_material_foreground = "original"
vim.g.gruvbox_material_background = "medium"

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.cmd("colorscheme gruvbox-material")

vim.o.updatetime = 250
-- vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]])

