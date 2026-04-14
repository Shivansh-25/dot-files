return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@diagnostic disable-next-line: undefined-doc-name
	---@type Flash.Config
	opts = {},
	keys = {
		{ "s",         mode = { "n", "x", "o" }, function() require("flash").jump() end,              nowait = true,               desc = "Flash" },
		{ "<leader>S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
		{ "r",         mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
		{ "R",         mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		{ "<c-s>",     mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
	},
}
