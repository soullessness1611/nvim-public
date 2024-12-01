return {
	{
		"jellydn/quick-code-runner.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			debug = true,
			size = {
				width = "75%",
				height = "75%",
			},
		},
		cmd = { "QuickCodeRunner", "QuickCodePad" },
		keys = {
			{
				"<leader>cr",
				":QuickCodeRunner<CR>",
				desc = "Quick Code Runner",
				mode = "v",
			},
			{
				"<leader>cq",
				":QuickCodePad<CR>",
				desc = "Quick Code Pad",
			},
			{
				";q",
				"gg0vGg$:QuickCodeRunner<CR>",
				desc = "Quick File Code Runner",
				mode = "n",
			},
		},
	},
}
