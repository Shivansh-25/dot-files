require("config/lazy")
local keymap = vim.keymap

vim.g.mapleader = ' '
vim.opt.tabstop = 2;
vim.opt.shiftwidth = 4;
vim.opt.number = true
vim.opt.relativenumber = true
vim.o.winborder = 'rounded'

vim.opt.clipboard = "unnamedplus"
keymap.set("n", "<C-s>", ":wqa<CR>", { silent = true })
keymap.set("n", "<C-a>", "ggVG")
keymap.set("n", "<leader>q", ":q<CR>")
keymap.set("n", "<leader>w", ":wa<CR>")
keymap.set("n", "H", ":tabp<CR>")
keymap.set("n", "L", ":tabn<CR>")

-- minor fixes
keymap.set("n", "<c-u>", "<c-u>zz")
keymap.set("n", "<c-d>", "<c-d>zz")
keymap.set("n", "n", "nzz", { noremap = true })
keymap.set("n", "<s-n>", "nzz", { noremap = true })




vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	callback = function()
		vim.highlight.on_yank({
			-- Highlight group to use. 'IncSearch' or 'Visual' are common choices.
			higroup = "IncSearch",
			-- Duration in milliseconds (e.g., 200ms)
			timeout = 200,
		})
	end,
})
