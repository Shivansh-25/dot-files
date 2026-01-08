return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "nvim-mini/mini.icons" },
	opts = {},
	config = function()
		vim.keymap.set('n', '<leader>ff', ":FzfLua files<CR>", { desc = 'Telescope find files' })
		vim.keymap.set('n', '<leader>fs', ":FzfLua live_grep<CR>", { desc = 'Telescope live grep' })
		vim.keymap.set('n', '<leader>fS', ":FzfLua live_grep_native<CR>", { desc = 'Telescope live grep' })
		vim.keymap.set('n', '<leader>/', ":FzfLua lgrep_curbuf<CR>", { desc = 'Telescope live grep' })
		vim.keymap.set('v', '<leader>fs', ":FzfLua grep_visual<CR>", { desc = 'Telescope live grep' })
		-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
		-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
	end
}
