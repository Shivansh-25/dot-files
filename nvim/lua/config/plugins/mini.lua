return {
	{
		'echasnovski/mini.nvim',
		version = false,
		config = function()
			local statusline = require 'mini.statusline'
			local minipairs = require 'mini.pairs'
			statusline.setup { use_icons = true }
			minipairs.setup({})
		end

	},
}
