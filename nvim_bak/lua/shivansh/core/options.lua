local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local general = augroup("General", { clear = true })


vim.cmd("let g:netrw_liststyle = 3")

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 99
vim.o.conceallevel = 2

local opt = vim.opt

opt.relativenumber = true
opt.number = true

--tabs & indentation
opt.tabstop = 2 -- 2 space for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false -- turn line wrap false

--search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case sensitive

opt.cursorline = true -- highlight the line on which the cursor is present

-- turn on turngui colors for colorschemes to work
opt.termguicolors = true
opt.background = "dark" -- colorschemes where both light and dark modes available use the dark one
opt.signcolumn = "yes" -- show sign column so that the text doesnt shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspaces on indent, end of line and insert mode

--clipboard
opt.clipboard:append("unnamedplus") -- use the system clipboard

--split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontally window to the bottom

-- turn of swapfile
opt.swapfile = false

opt.cmdheight = 1
opt.scrolloff = 15

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
-- Default splitting will cause your main splits to jump when opening an edgebar.
-- To prevent this, set `splitkeep` to either `screen` or `topline`.
vim.opt.splitkeep = "screen"


--highlight text on yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})


autocmd({ "FocusLost", "BufLeave", "BufWinLeave", "InsertLeave" }, {
  -- nested = true, -- for format on save
  callback = function()
    if vim.bo.filetype ~= "" and vim.bo.buftype == "" then
      vim.cmd "silent! w"
    end
  end,
  group = general,
  desc = "Auto Save",
})

autocmd("FocusGained", {
  callback = function()
    vim.cmd "checktime"
  end,
  group = general,
  desc = "Update file when there are changes",
})
