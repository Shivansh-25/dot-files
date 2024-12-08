return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")
		telescope.setup({
			defaults = {
				path_display = { "smart" },
				file_ignore_patterns = { ".git/", ".cache/", "node_modules/" },
				mappings = {
					i = {
						["<c-k>"] = actions.move_selection_previous, -- move to prev result
						["<c-j>"] = actions.move_selection_next, -- move to next result
						["<c-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
				layout_config = {
					width = 0.8,
					height = 0.8,
				},
				borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
				winblend = 10, -- Adjust this value to change opacity (0-100)
				prompt_prefix = " ",
				selection_caret = " ",
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")

		-- Create a custom highlight group for Telescope
		-- Create custom highlight groups for Telescope
		-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#1a1b26" })
		-- vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#24283b" })
		-- vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "#1a1b26" })
		-- vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "#1a1b26" })
		-- vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#7aa2f7", bg = "#1a1b26" })
		-- vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#7aa2f7", bg = "#24283b" })
		-- vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#7aa2f7", bg = "#1a1b26" })
		-- vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#7aa2f7", bg = "#1a1b26" })
		--
		-- vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#3c3f5a", fg = "#ffffff" }) -- Selected line color
		-- vim.api.nvim_set_hl(0, "TelescopeMultiSelection", { bg = "#3c3f5a", fg = "#ffffff" }) -- Color for multi-selected items
		-- vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#ff79c6" }) -- Highlight for matching text

		vim.keymap.set("n", "<leader>/", function()
			-- you can pass additional configuration to telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] fuzzily search in current buffer" })

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "fuzzy find files in cwd" })
		-- keymap.set("n", "<leader>ff", ":Telescope frecency workspace=CWD<cr>", { noremap = true, silent = true, desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "find string under cursor in cwd" })
		keymap.set("n", "<leader>fb", builtin.buffers, { desc = "search in all the open buffers" })
	end,
}
