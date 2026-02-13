------------------------------------------------------------

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

------------------------------------------------------------

vim.opt.number = false
vim.opt.relativenumber = false
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
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = 'split'

vim.opt.termguicolors = true vim.opt.signcolumn = "yes" vim.opt.cursorline = true vim.opt.scrolloff = 8 vim.opt.sidescrolloff = 8

------------------------------------------------------------

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'netrw',
	callback = function()
		vim.opt_local.number = true
		vim.opt_local.relativenumber = true
	end,
})

vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_altv = 1

------------------------------------------------------------

local keymap_set = vim.keymap.set

keymap_set('n', '<leader>fe', vim.cmd.Ex)

keymap_set('n', '<leader><leader>', function()
	vim.cmd("set number!")
	vim.cmd("set relativenumber!")
end)

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

------------------------------------------------------------

keymap_set('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
keymap_set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
keymap_set('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
keymap_set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>')
keymap_set('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>')
keymap_set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<CR>')

------------------------------------------------------------

vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

------------------------------------------------------------

require('lazy').setup({
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
	},

	{
		'nvim-telescope/telescope.nvim',
		event = 'VimEnter',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make',
				cond = function()
					return vim.fn.executable 'make' == 1
				end,
			},
			{ 'nvim-telescope/telescope-ui-select.nvim' },
		},
		config = function()
			local telescope = require('telescope')
			telescope.setup {
				defaults = {
				},
				pickers = {
					colorscheme = { enable_preview = true },
				},
				extensions = {
					['ui-select'] = require('telescope.themes').get_dropdown(),
				},
			}
			pcall(telescope.load_extension, 'fzf')
			pcall(telescope.load_extension, 'ui-select')
		end,
	},


	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'mason-org/mason.nvim', opts = {} },
			'WhoIsSethDaniel/mason-tool-installer.nvim',
			{ 'j-hui/fidget.nvim', opts = {} },
			'saghen/blink.cmp',
		},
		config = function()
			local border = "rounded"

			vim.lsp.handlers["textDocument/hover"] =
				vim.lsp.with(vim.lsp.handlers.hover, { border = border })

			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				float = { border = border },
			})

			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
				callback = function(event)
					local buf = event.buf
					local map = function(keys, func)
						vim.keymap.set('n', keys, func, { buffer = buf })
					end

					map('grn', vim.lsp.buf.rename)
					map('gra', vim.lsp.buf.code_action)
					map('grD', vim.lsp.buf.declaration)
					map('grd', vim.lsp.buf.definition)

					map('ge', vim.diagnostic.open_float)
				end,
			})

			local capabilities = require('blink.cmp').get_lsp_capabilities()

			local servers = {
				clangd = {},
				ols = {},
			}

			require('mason-tool-installer').setup {
				ensure_installed = vim.tbl_keys(servers),
			}

			for name, server in pairs(servers) do
				server.capabilities = vim.tbl_deep_extend(
					'force',
					{},
					capabilities,
					server.capabilities or {}
				)
				vim.lsp.config(name, server)
				vim.lsp.enable(name)
			end
		end,
	},

	{
		'nvim-treesitter/nvim-treesitter',
		tag = "v0.10.0",
		lazy = false,
		build = ":TSUpdate",
	},
})

------------------------------------------------------------

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"python", "cpp", "c", "proto", "dockerfile",
		"starlark", "bash", "javascript", "lua",
	},
	highlight = { enable = true },
	indent = { enable = true },
})

vim.cmd("colorscheme my_theme")

