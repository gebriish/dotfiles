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

