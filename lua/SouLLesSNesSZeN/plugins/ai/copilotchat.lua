return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "canary",
	dependencies = {
		{ "zbirenbaum/copilot.lua", opts = {} }, -- or github/copilot.nvim
		{ "nvim-lua/plenary.nvim", lazy = true }, -- for curl, log warper
	},
	build = "make tiktoken", -- Only on MacOS or linux
	config = function()
		require("CopilotChat").setup({
			debug = true, -- Enable debuging
		})
	end,
}
