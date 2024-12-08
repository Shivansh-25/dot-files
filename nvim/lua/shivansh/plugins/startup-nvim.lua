return {
	"goolord/alpha-nvim",
	dependencies = {
		"echasnovski/mini.icons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = "#84e3c8" }) -- Indigo
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = "#a8e6cf" }) -- Deep Purple
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = "#dcedc1" }) -- Deep Purple
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = "#ffd3b6" }) -- Medium Purple
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo5", { fg = "#ffaaa5" }) -- Light Purple
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo6", { fg = "#ff8b94" }) -- Very Light Purple
		vim.api.nvim_set_hl(0, "NeovimDashboardUsername", { fg = "#ff7480" }) -- light purple
		dashboard.section.header.type = "group"
		dashboard.section.header.val = {
			{
				type = "text",
				val = "   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
				opts = { hl = "NeovimDashboardLogo1", shrink_margin = false, position = "center" },
			},
			{
				type = "text",
				val = "   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
				opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" },
			},
			{
				type = "text",
				val = "   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
				opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" },
			},
			{
				type = "text",
				val = "   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
				opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" },
			},
			{
				type = "text",
				val = "   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
				opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" },
			},
			{
				type = "text",
				val = "   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
				opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" },
			},
			{
				type = "padding",
				val = 1,
			},
			{
				type = "text",
				val = "Fuck it, we ball",
				opts = { hl = "NeovimDashboardUsername", shrink_margin = false, position = "center" },
			},
		}
		dashboard.section.buttons.val = {
			dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
			dashboard.button("e", "  > Find String", ":Telescope live_grep<CR>"),
			dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("s", "  > Settings", ":e $MYVIMRC <CR>"),
			dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
		}
		alpha.setup(dashboard.opts)
		vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
	end,
}
