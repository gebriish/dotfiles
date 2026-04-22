vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false

vim.opt.breakindent = true
vim.opt.updatetime = 250
vim.opt.guicursor = ''

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = 'split'

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

local map = vim.keymap.set

map('n', '<leader>fe', vim.cmd.Ex)
map('n', '<leader><leader>', function() vim.opt.number = not vim.opt.number:get() end)

map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('t', '<Esc><Esc>', '<C-\\><C-n>')

map('v', '<A-k>', ":m '<-2<CR>gv=gv")
map('v', '<A-j>', ":m '>+1<CR>gv=gv")

map('n', '<leader>tn', ':tabnew<CR>')
map('n', '<leader>x', ':tabclose<CR>')
map('n', '>', ':tabnext<CR>')
map('n', '<', ':tabprev<CR>')

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.hl.on_yank() end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'netrw',
    callback = function()
        vim.opt_local.number = true
        vim.opt_local.relativenumber = true
    end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

    -- Autopairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        event = 'VimEnter',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function() return vim.fn.executable('make') == 1 end,
            },
            'nvim-telescope/telescope-ui-select.nvim',
        },
        config = function()
            local telescope = require('telescope')
            telescope.setup({
                extensions = {
                    ['ui-select'] = require('telescope.themes').get_dropdown(),
                },
            })
            pcall(telescope.load_extension, 'fzf')
            pcall(telescope.load_extension, 'ui-select')

            map('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
            map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
            map('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
            map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>')
        end,
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "lua", "c", "cpp", "python", "bash", "javascript"
                },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },


    -- LSP
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'mason-org/mason.nvim', opts = {} },
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            { 'j-hui/fidget.nvim', opts = {} },
        },
        config = function()

            -- Diagnostics UI
            vim.diagnostic.config({
                virtual_text = false,
                signs = true,
                underline = true,
                float = { border = "rounded" },
            })

            -- LSP keymaps
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(event)
                    local buf = event.buf
                    local opts = { buffer = buf }

                    map('n', 'gd', vim.lsp.buf.definition, opts)
                    map('n', 'gD', vim.lsp.buf.declaration, opts)
                    map('n', 'gr', vim.lsp.buf.references, opts)
                    map('n', 'K', vim.lsp.buf.hover, opts)
                    map('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                    map('n', '<leader>e', vim.diagnostic.open_float, opts)
                end,
            })

            -- LSP servers
            local servers = {
                clangd = {},
                ols = {},
				zls = {}
            }

            require('mason-tool-installer').setup({
                ensure_installed = vim.tbl_keys(servers),
            })

            for name, config in pairs(servers) do
                vim.lsp.config(name, config)
                vim.lsp.enable(name)
            end
        end,
    },
})

vim.cmd.colorscheme('jblowtheme')
