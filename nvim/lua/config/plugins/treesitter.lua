return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = 'main',
		lazy = false,
		config = function()
			local ensureInstalled = {
				"c", "lua", "vim", "vimdoc",
			}
			local alreadyInstalled = require('nvim-treesitter.config').get_installed()
			local parsersToInstall = vim.iter(ensureInstalled)
					:filter(function(parser)
						return not vim.tbl_contains(alreadyInstalled, parser)
					end)
					:totable()
			require('nvim-treesitter').install(parsersToInstall)

			vim.api.nvim_create_autocmd('FileType', {
				callback = function()
					pcall(vim.treesitter.start)
					-- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	}
}

