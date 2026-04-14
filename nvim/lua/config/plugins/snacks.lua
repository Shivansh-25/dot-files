return
{
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@diagnostic disable-next-line: undefined-doc-name
	---@type snacks.Config
	opts = {
		notifier = { enabled = true },
		input = { enabled = true },
		indent = { enabled = true, char = '|' },
		scope = { enabled = true },
		scroll = { enabled = false },
		words = { enabled = true },
		bufdelete = { enabled = true },
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
		picker = {
			enabled = true,
			auto_pick = false,
			sources = {
				explorer = {
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
		{ "<leader>ee",      function() Snacks.explorer() end,              desc = "Explorer" },
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
		{ "<leader><space>", function() Snacks.picker.smart() end,          desc = "Smart Find Files" },
		{ "<leader>/",       function() Snacks.picker.lines() end,          desc = "Buffer Lines" },
		{ "<leader>,",       function() Snacks.picker.buffers() end,        desc = "Buffers" },
		{ "<leader>sh",      function() Snacks.picker.help() end,           desc = "Help Pages" },
		{ "<leader>gr",      function() Snacks.picker.lsp_references() end, nowait = true,                desc = "References" },
		{ "<leader>q",       function() Snacks.bufdelete() end,             desc = "Buffer Delete" },
		{ "<leader>Q",       function() Snacks.bufdelete.other() end,       desc = "Delete Other Buffers" },
	},
}
