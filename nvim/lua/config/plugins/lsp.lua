return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ 'saghen/blink.cmp' },
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
			{ "williamboman/mason-lspconfig.nvim" },
		},

		config = function()
			local capabilities = require('blink.cmp').get_lsp_capabilities()

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						-- Inside the handler function
						vim.lsp.config({
							capabilities = capabilities
						})
						vim.lsp.enable(server_name)
					end
				}
			})
			-- This ensures that diagnostics are shown as virtual text
			vim.diagnostic.config({
				virtual_lines = true,
				-- virtual_text = {
				-- 	-- 	current_line = true,
				-- 	enable = true,
				-- },
				virtual_text = false,
				signs = true,
				update_in_insert = false, -- Don't show diagnostics while typing in insert mode
				severity_sort = true, -- Show most severe diagnostics first
			})

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
			vim.keymap.set("n", "ca", vim.lsp.buf.code_action, { desc = "Code Actions" })

			-- inlay hints
			vim.lsp.inlay_hint.enable(false)
			vim.keymap.set("n", "<leader>ih", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end, { desc = "Toggle inlay hints" })

			-- lsp keymaps (info and restart)
			vim.keymap.set("n", "<leader>li", function()
				print("Attached LSP clients:")
				for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
					print("  - " .. client.name .. " (id: " .. client.id .. ")")
				end
			end, { desc = "Show LSP info" })
			vim.keymap.set("n", "<leader>lr", function()
				vim.cmd("LspRestart")
				print("LSP restarted")
			end, { desc = "Restart LSP" })
		end
	},
}
