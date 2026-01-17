return {
	{
		'echasnovski/mini.nvim',
		version = false,
		config = function()
			require('mini.statusline').setup({ use_icons = true })
			require('mini.pairs').setup({})
			require('mini.icons').setup()
			require('mini.surround').setup({
				mappings = {
					add = 'gsa',  -- Add surrounding
					delete = 'gsd', -- Delete surrounding
					find = 'gsf', -- Find surrounding
					find_left = 'gsF', -- Find surrounding left
					highlight = 'gsh', -- Highlight surrounding
					replace = 'gsr', -- Replace (No longer conflicts with 's')
					update_n_lines = 'gsn',
				},
			})
			require('mini.tabline').setup()
		end

	},
}
