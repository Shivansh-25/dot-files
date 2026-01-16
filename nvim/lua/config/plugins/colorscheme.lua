-- return {
-- 	"EdenEast/nightfox.nvim",
-- 	config = function()
-- 		require('nightfox').setup({
-- 			options = {
-- 				transparent = true,
-- 			}
-- 		})
-- 		vim.cmd("colorscheme carbonfox")
-- 	end
-- }
return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("cyberdream").setup({
			transparent = true,
			-- borderless_pickers = true,
			terminal_colors = true,
			italic_comments = true,
			extensions = {
				blinkcmp = true,
				fzflua = true,
				mini = true,
				treesitter = true,
			}
		})
		vim.cmd("colorscheme cyberdream")
	end
}
