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
		scroll = { enabled = true },
		words = { enabled = true },
		picker = {
			enabled = true,
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
		-- Toggle the explorer
		{ "<leader>ee",      function() Snacks.explorer() end,       desc = "Explorer" },
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
		{ "<leader><space>", function() Snacks.picker.smart() end,   desc = "Smart Find Files" },
		{ "<leader>ff",      function() Snacks.picker.files() end,   desc = "Find Files" },
		{ "<leader>fs",      function() Snacks.picker.grep() end,    desc = "Grep" },
		{ "<leader>/",       function() Snacks.picker.lines() end,   desc = "Buffer Lines" },
		{ "<leader>,",       function() Snacks.picker.buffers() end, desc = "Buffers" },
	},
}
