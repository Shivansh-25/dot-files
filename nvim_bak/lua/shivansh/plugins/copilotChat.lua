return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "main",
	dependencies = {
		{ "zbirenbaum/copilot.lua" },
		{ "nvim-lua/plenary.nvim" },
	},
	build = "make tiktoken",
	opts = {
		debug = false,
		model = "claude-3.5-sonnet",
		question_header = "## User ", -- Header to use for user questions
		answer_header = "## Copilot ", -- Header to use for AI answers
		error_header = "## Error ", -- Header to use for errors
		separator = "───", -- Separator to use in chat

		chat_autocomplete = true, -- Enable chat autocompletion (when disabled, requires manual `mappings.complete` trigger)
		show_folds = true, -- Shows folds for sections in chat
		show_help = true, -- Shows help message as virtual lines when waiting for user input
		auto_follow_cursor = true, -- Auto-follow cursor in chat
		auto_insert_mode = false, -- Automatically enter insert mode when opening window and on new prompt
		insert_at_end = false, -- Move cursor to end of buffer when inserting text
		clear_chat_on_new_prompt = false, -- Clears chat on every new prompt
		highlight_selection = false, -- Highlight selection in the source buffer when in the chat window
		highlight_headers = true, -- Highlight headers in chat, disable if using markdown renderers (like render-markdown.nvim)

		vim.api.nvim_set_keymap("n", "<leader>cc", ":CopilotChat<CR>", { noremap = true, silent = true }),
		vim.api.nvim_set_keymap("v", "<leader>cc", ":CopilotChat<CR>", { noremap = true, silent = true }),
		vim.keymap.set("n", "<leader>ccq", function()
			local input = vim.fn.input("Quick Chat: ")
			if input ~= "" then
				require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
			end
		end, { desc = "Quick Chat", noremap = true, silent = true }),
	},
	config = function()
		require("CopilotChat").setup({
			debug = false,

			window = {
				layout = "vertical",
				-- relative = "editor",
				width = 0.4,
				-- height = 0.6,
				-- row = 1,
			},
		})
	end,
}
