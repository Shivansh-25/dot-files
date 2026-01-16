-- return {
-- 	"nvim-tree/nvim-tree.lua",
-- 	config = function()
-- 		require("nvim-tree").setup({
-- 			view = { side = "right" }
-- 		})
-- 		vim.keymap.set('n', '<leader>ee', ":NvimTreeToggle<CR>")
-- 		vim.keymap.set('n', '<leader>ef', ":NvimTreeFindFile<CR>")
-- 	end
-- }
--
--
return -- lazy.nvim
{
	"folke/snacks.nvim",
	opts = {
		picker = {
			sources = {
				explorer = {
					-- This is where explorer-specific UI logic goes
					layout = {
						layout = {
							position = "right",
						},
					},
				},
			},
		},
	},
	keys = {
		-- Toggle the explorer
		{ "<leader>ee", function() Snacks.explorer() end, desc = "Explorer" },
		{
			"<leader>ef",
			function()
				---@diagnostic disable-next-line: undefined-global
				Snacks.explorer.reveal()
				local picker = Snacks.picker.get({ source = "explorer" })[1]
				if picker then picker:focus() end
			end,
			desc = "Reveal File"
		},
	},
}
