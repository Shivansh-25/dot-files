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
		highlight_selection = true, -- Highlight selection in the source buffer when in the chat window
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
			prompts = {
				MyCustomPrompt = {
					prompt = "Implement the changes in the provided code",
					system_prompt = [[You are very good at explaining stuff. Your task is to modify the provided code according to the user's request. Follow these instructions precisely:

1. Return *ONLY* the modified code.

2. *DO NOT* include any explanations, comments, or line numbers in your response.

3. Ensure the returned code is complete and can be directly used as a replacement for the original code.

4. Preserve the original structure, indentation, and formatting of the code as much as possible.

5. Omit any parts of the code, even if they are unchanged.

6. Maintain the *SAME INDENTATION* in the returned code as in the source code

7. *ONLY* return the new code snippets to be updated, *DO NOT* return the entire file content.

8. If the response do not fits in a single message, split the response into multiple messages.

9. Directly above every returned code snippet, add `[file:<file_name>](<file_path>) line:<start_line>-<end_line>`. Example: `[file:copilot.lua](nvim/.config/nvim/lua/config/copilot.lua) line:1-98`. This is markdown link syntax, so make sure to follow it.

10. When fixing code pay close attention to diagnostics as well. When fixing diagnostics, include diagnostic content in your response.

Remember that Your response SHOULD CONTAIN ONLY THE MODIFIED CODE to be used as DIRECT REPLACEMENT to the original file.]],
					mapping = "<leader>ccmc",
					description = "My custom prompt description",
				},
			},
		})
	end,
}
