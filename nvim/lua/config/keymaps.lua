local function map_set(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { desc = desc, noremap = true, silent = true })
end

map_set('n', '<leader>fe', vim.cmd.Ex)
map_set('n', '<C-l>', '<C-w>l')
map_set('n', '<C-k>', '<C-w>k')
map_set('n', '<C-j>', '<C-w>j')
map_set('n', '<C-h>', '<C-w>h')

map_set('n', '<Esc>', '<cmd>nohlsearch<CR>')
map_set('t', '<Esc><Esc>', '<C-\\><C-n>')

