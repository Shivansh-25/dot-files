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
-- keymap.set("n", "<leader>q", ":q<CR>")
keymap.set("n", "<leader>w", ":wa<CR>")
keymap.set("n", "H", ":tabp<CR>")
keymap.set("n", "L", ":tabn<CR>")
keymap.set("n", "<Esc>", ":nohlsearch<CR>", { noremap = true, silent = true })

-- minor fixes
keymap.set("n", "<c-u>", "<c-u>zz")
keymap.set("n", "<c-d>", "<c-d>zz")
keymap.set("n", "n", "nzz", { noremap = true })
keymap.set("n", "<s-n>", "nzz", { noremap = true })

keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
keymap.set('n', 'k', 'gk', { noremap = true, silent = true })

keymap.set('n', 'H', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
keymap.set('n', 'L', '<cmd>bnext<cr>', { desc = 'Next buffer' })

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

local function get_day_with_suffix(day)
	local d = tonumber(day)
	if d > 10 and d < 20 then return d .. "th" end
	local last_digit = d % 10
	if last_digit == 1 then
		return d .. "st"
	elseif last_digit == 2 then
		return d .. "nd"
	elseif last_digit == 3 then
		return d .. "rd"
	else
		return d .. "th"
	end
end

local function create_monthly_note()
	local month = os.date("%B")
	local day_num = os.date("%d")
	local day_with_suffix = get_day_with_suffix(day_num)
	local extension = ".md"
	local filename = month .. "/" .. day_with_suffix .. extension
	---@diagnostic disable-next-line: param-type-mismatch
	vim.fn.mkdir(month, "p")

	vim.cmd("edit " .. filename)
	vim.cmd("write")
	print("Created: " .. filename)
end

vim.keymap.set("n", "<leader>nn", create_monthly_note, { desc = "New note: Month/Day.md" })

local function insert_timestamp()
	local time = os.date("%H:%M:%S")
	local separator = "---"
	---@diagnostic disable-next-line: assign-type-mismatch
	vim.api.nvim_put({ time, separator, "" }, "l", true, true)
end

vim.keymap.set("n", "<leader>it", insert_timestamp, { desc = "Insert 24h timestamp and separator" })

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'go' },
	callback = function()
		pcall(vim.treesitter.start) -- Enable highlighting
		vim.wo.foldmethod = 'expr'
		vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
	end,
})
