-- return {
-- 	"scottmckendry/cyberdream.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
--     require("cyberdream").setup({
--       transparent = true,
--       italic_comments = true,
--     })
-- 		vim.cmd("colorscheme cyberdream")
-- 	end,
-- }
--
return {
	"rebelot/kanagawa.nvim",
	config = function()
		-- First, set the colorscheme
		require("kanagawa").setup({
      transparent = true,
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none",
						},
					},
				},
			},
		})
		vim.cmd("colorscheme kanagawa-wave")

		-- Retrieve the theme colors after setting the colorscheme
		local colors = require("kanagawa.colors").setup()
		local theme = colors.theme

		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalDark", { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 })
		vim.api.nvim_set_hl(0, "LazyNormal", { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim })
		vim.api.nvim_set_hl(0, "MasonNormal", { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim })

		-- Set custom highlights for Telescope
		vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = theme.ui.special, bold = true })
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = theme.ui.bg_p1 })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 })
		vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 })
		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 })
		vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = theme.ui.bg_dim })
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim })
	end,
}
-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		local catppuccin = require("catppuccin")
-- 		local is_transparent = true
-- 		catppuccin.setup({
-- 			transparent_background = is_transparent,
-- 			flavour = "mocha",
-- 			term_colors = true,
-- 		})
-- 		vim.cmd("colorscheme catppuccin-mocha")
-- 	end,
-- }
-- return {
-- 	"EdenEast/nightfox.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		local nightfox = require("nightfox")
-- 		local is_transparent = false  -- Track the transparency state
--
-- 		nightfox.setup({
-- 			options = {
-- 				transparent = is_transparent,
-- 			}
-- 		})
--
-- 		vim.cmd("colorscheme duskfox")  -- Apply the colorscheme
--
-- 		-- Toggle transparency function
-- 		local function toggle_transparency()
-- 			is_transparent = not is_transparent
-- 			nightfox.setup({
-- 				options = {
-- 					transparent = is_transparent,
-- 				}
-- 			})
-- 			vim.cmd("colorscheme duskfox")
-- 		end
--
-- 		-- Create user command to toggle transparency
-- 		vim.api.nvim_create_user_command("ToggleTransparency", toggle_transparency, { desc = "Toggle transparency for nightfox colorscheme" })
--
-- 		-- Set keymap to toggle transparency using the user command
-- 		vim.api.nvim_set_keymap("n", "<leader>tt", ":ToggleTransparency<CR>", { noremap = true, silent = true })
-- 	end,
-- }
