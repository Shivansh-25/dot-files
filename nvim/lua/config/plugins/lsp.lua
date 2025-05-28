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
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end
				}
			})
			-- This ensures that diagnostics are shown as virtual text
			vim.diagnostic.config({
				virtual_text = {
					enable = true,
				},
				signs = true,
				update_in_insert = false, -- Don't show diagnostics while typing in insert mode
				severity_sort = true, -- Show most severe diagnostics first
			})
		end
	},
}
