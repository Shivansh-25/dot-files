return{
	"mistricky/codesnap.nvim",
	buildc= "make build_generator",
	keys = {
		{ "<leader>cs", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
	},
	opts = {
		save_path = "~/Pictures",
		has_breadcrumbs = true,
		bg_theme = "bamboo",
	},
}
