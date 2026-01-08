return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			-- Global configuration
			size = 25,
			open_mapping = [[<c-\>]], -- Default toggle key
			hide_numbers = true,
			shade_terminals = true,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			direction = "float", -- Default to floating windows
			close_on_exit = true,
			float_opts = {
				border = "curved",
				winblend = 3,
			},
		})

		-- 1. Define the jjui Terminal object
		local Terminal = require("toggleterm.terminal").Terminal
		local jjui = Terminal:new({
			cmd = "jjui",
			dir = "git_dir", -- Open in the root of the repo
			direction = "float",
			float_opts = {
				border = "double",
			},
			-- Close the terminal window when jj ui exits
			on_close = function(term)
				vim.cmd("startinsert!")
			end,
		})

		-- 2. Create a function to toggle it
		function _jjui_toggle()
			jjui:toggle()
		end

		-- 3. Set the keybinding: <leader>jj
		vim.keymap.set("n", "<leader>jj", "<cmd>lua _jjui_toggle()<CR>", {
			noremap = true,
			silent = true,
			desc = "Jujutsu UI"
		})
	end,
}
