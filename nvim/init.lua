require("config/lazy")
local keymap = vim.keymap

vim.g.mapleader = ' '
vim.opt.tabstop = 2;
vim.opt.shiftwidth = 2;
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"
keymap.set("n", "<C-s>", ":wqa<CR>", { silent = true })
keymap.set("n", "<C-a>", "ggVG")
keymap.set("n", "<leader>q", ":q<CR>")
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "H", ":tabp<CR>")
keymap.set("n", "L", ":tabn<CR>")

-- minor fixes
keymap.set("n", "<c-u>", "<c-u>zz")
keymap.set("n", "<c-d>", "<c-d>zz")
keymap.set("n", "n", "nzz", { noremap = true })
keymap.set("n", "<s-n>", "nzz", { noremap = true })

keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })
keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window' })
keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to top window' })
