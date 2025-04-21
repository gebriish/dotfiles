return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                              , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		require("telescope").setup {
			extensions = {
				['ui-select'] = {
					require("telescope.themes").get_dropdown()
				}
			}
		}

		pcall(require('telescope').load_extension, 'fzf')
		pcall(require('telescope').load_extension, 'ui-select')

		local builtin = require 'telescope.builtin'

		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
		vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = '[F]ind [H]elp' })
		vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
		vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[F]ind [S]elect Telescope' })
		vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
		vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
		vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
		vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

		vim.keymap.set('n', '<leader>/', function()
			builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
				winblend = 10,
				previewer = false,
			})
		end)

		vim.keymap.set('n', '<leader>f/', function()
			builtin.live_grep {
				grep_open_files = true,
				prompt_title = 'Live Grep in Open Files',
			}
		end)

		vim.keymap.set('n', '<leader>fn', function()
			builtin.find_files { cwd = vim.fn.stdpath 'config' }
		end)
	end
	}
