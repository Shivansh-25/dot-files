return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "nvim-mini/mini.icons" },
	opts = {},
	config = function()
		require('fzf-lua').setup({
			files = {
				multiprocess = true,
				git_icons    = false,
				file_icons   = true,
				color_icons  = true,
				find_opts    = [[-type f \! -path '*/.git/*' \! -path '*/.jj/*']],
				rg_opts      = [[--color=never --hidden --files -g "!.git" -g "!.jj"]],
				fd_opts      = [[--color=never --hidden --type f --type l --exclude .git --exclude .jj]],
				dir_opts     = [[/s/b/a:-d]],
			}
		})
		vim.keymap.set('n', '<leader>ff', ":FzfLua files<CR>", { desc = 'FZF find files' })
		vim.keymap.set('n', '<leader>fs', ":FzfLua live_grep<CR>", { desc = 'FZF live grep word' })
		vim.keymap.set('n', '<leader>fS', ":FzfLua live_grep_native<CR>", { desc = 'FZF live grep word native' })
		vim.keymap.set('n', '<leader>/', ":FzfLua lgrep_curbuf<CR>", { desc = 'FZF live grep current buffer' })
		vim.keymap.set('v', '<leader>fs', ":FzfLua grep_visual<CR>", { desc = 'FZF live grep word under cursor' })
		-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'FZF buffers' })
		-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'FZF help tags' })
	end
}
