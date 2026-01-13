return {
	"Kurama622/llm.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
	cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" },
	config = function()
		require("llm").setup({
			models = {
				{
					name = "MiniMax M2.1",
					url = "https://openrouter.ai/api/v1/chat/completions",
					model = "minimax/minimax-m2.1",
					api_type = "openai"
				},
				{
					name = "MiMo V2 Flash",
					url = "https://openrouter.ai/api/v1/chat/completions",
					model = "xiaomi/mimo-v2-flash:free",
					api_type = "openai"
				},
				{
					name = "GPT OSS 120b",
					url = "https://openrouter.ai/api/v1/chat/completions",
					model = "openai/gpt-oss-120b:exacto",
					api_type = "openai"
				},
			},
			keys = {
				-- float style
				["Input:ModelsNext"] = { mode = { "n", "i" }, key = "<C-Down>" },
				["Input:ModelsPrev"] = { mode = { "n", "i" }, key = "<C-Up>" },

				["Input:HistoryNext"] = { mode = { "n", "i" }, key = "<C-j>" },
				["Input:HistoryPrev"] = { mode = { "n", "i" }, key = "<C-k>" },
			},
			app_handler = {
				Ask = {
					handler = "disposable_ask_handler",
					opts = {
						position = {
							row = 2,
							col = 0,
						},
						title = " Ask ",
						inline_assistant = true,
						enable_buffer_context = true,
						language = "English",
						diagnostic = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN },
						url = "https://openrouter.ai/api/v1/chat/completions",
						model = "openai/gpt-oss-120b:exacto",
						api_type = "openai",
						-- fetch_key = vim.env.CHAT_ANYWHERE_KEY,
						display = {
							mapping = {
								mode = "n",
								keys = { "d" },
							},
							action = nil,
						},
						accept = {
							mapping = {
								mode = "n",
								keys = { "Y", "y" },
							},
							action = nil,
						},
						reject = {
							mapping = {
								mode = "n",
								keys = { "N", "n" },
							},
							action = nil,
						},
						close = {
							mapping = {
								mode = "n",
								keys = { "<esc>" },
							},
							action = nil,
						},
					},
				},
				CreditLeft = {
					handler = function()
						local tools = require("llm.tools")
						local key = os.getenv("OPENROUTER_API_KEY")
						local res = tools.curl_request_handler(
							"https://openrouter.ai/api/v1/credits",
							{ "GET", "-H", string.format("'Authorization: Bearer %s'", key) }
						)
						if res ~= nil then
							local remaining = res.data.total_credits - res.data.total_usage
							print("remaining credits: " .. remaining)
						end
					end,
				}
			}
		})
	end,
	keys = {
		{ "<leader>ac", mode = "n",          "<cmd>LLMSessionToggle<cr>" },
		{ "<leader>aa", mode = { "n", "x" }, "<cmd>LLMAppHandler Ask<cr>" },
	},
}
