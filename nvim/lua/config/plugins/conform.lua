return {
	'stevearc/conform.nvim',
	opts = {},
	config = function()
		local conform = require("conform")
		conform.setup({
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				go = { "gofumpt" },
			}
		})
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 10000,
			})
		end
		)
	end
}
