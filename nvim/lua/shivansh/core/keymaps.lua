vim.g.mapleader = " "
vim.g.maplocalleader = ","

local keymap = vim.keymap --for conciseness

keymap.set("i", "jk", "<esc>", { desc = "exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<cr>", { desc = "clear search highlights" })
keymap.set("n", "<leader>dt", ":DiagnosticToggle<cr>", { desc = "remove diagnostic" })

-- incerment/decrement numbers
keymap.set("n", "<leader>+", "<c-a>", { desc = "increment number" }) -- increment
keymap.set("n", "<leader>-", "<c-x", { desc = "decrement number" }) -- decrement ( issue )

-- window management
keymap.set("n", "<leader>sv", "<c-w>v", { desc = "split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<c-w>s", { desc = "split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<c-w>=", { desc = "make splits equal size" }) -- split window horizontally
keymap.set("n", "<leader>sx", "<cmd>close<cr>", { desc = "close current split" }) -- close current split

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "close current tab" }) -- close current tab
keymap.set("n", "<s-l>", "<cmd>tabn<cr>", { desc = "go to next tab" }) --  go to next tab
keymap.set("n", "<s-h>", "<cmd>tabp<cr>", { desc = "go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<cr>", { desc = "open current buffer in new tab" }) --  move current buffer to new tab

-- minor fixes
keymap.set("n", "<c-u>", "<c-u>zz")
keymap.set("n", "<c-d>", "<c-d>zz")
keymap.set("n", "n", "nzz", { noremap = true })
keymap.set("n", "<s-n>", "nzz", { noremap = true })

-- select all
keymap.set("n", "<c-a>", "gg<s-V>G", { noremap = true })

-- saving and quitting
keymap.set("n", "<c-s>", ":wqa<cr>", { desc = "save and quit all" })
keymap.set("n", "<c-w>", ":qa<cr>", { desc = "save and quit all" })
keymap.set("n", "<leader>q", ":q<cr>", { desc = "quit" })
keymap.set("n", "<leader>co", "I{/*<esc>A*/}<esc>", { desc = "comment in tsx and jsx" })

-- keymap.set("n", "<leader>z", ":tabnew ~/.config/wezterm/wezterm.lua<cr>", { desc = "open wezterm config" })

keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<cr>", { desc = "dismiss noice notification" })

-- turn off diagnostics
vim.api.nvim_create_user_command("DiagnosticToggle", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config({
		virtual_text = not vt,
		-- underline = not vt,
		-- signs = not vt,
	})
end, { desc = "toggle diagnostic" })


keymap.set("n", "<leader>rc", function()
	local file_name = vim.api.nvim_buf_get_name(0)
	local file_type = vim.bo.filetype

	if file_type == "javascript" then -- Change "js" to "javascript" for consistency with filetype.
		vim.cmd("vsplit")
		vim.cmd("terminal node " .. file_name)
	elseif file_type == "cpp" then
		vim.cmd("tabnew | terminal g++ -std=c++17 " .. file_name .. " -o a.out && ./a.out")
	elseif file_type == "python" then
		vim.cmd("terminal python3 " .. file_name)
	end
end, { desc = "Run the code" })

vim.api.nvim_set_keymap("n", "<leader>at", ":CompetiTest add_testcase<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>ct", "i- [ ] <Esc>a", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>md", "0f[ax<leader><Esc>dt]o", { noremap = true, silent = true })
