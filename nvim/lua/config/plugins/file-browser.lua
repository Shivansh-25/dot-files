return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			view = { side = "right" }
		})
		vim.keymap.set('n', '<leader>ee', ":NvimTreeToggle<CR>")
		vim.keymap.set('n', '<leader>ef', ":NvimTreeFindFile<CR>")
	end
}
