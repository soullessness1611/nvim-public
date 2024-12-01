return {
	-- Gisigns
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "󰐙" }, -- 󰐙 
					change = { text = "󰻃" }, -- 󰻃 
					delete = { text = "󰍷" }, -- 󰍷 
					topdelete = { text = "󰫓" }, -- 󰍵 󰱝 󱅁 󰫓
					changedelete = { text = "󰢃" }, -- 󰱞 󰍚
					untracked = { text = "󰰩" }, -- 󰰧
				},
				signs_staged = {
					add = { text = "" },
					change = { text = "" },
					delete = { text = "" },
					topdelete = { text = "󱅂" }, -- 󰍵 󰱝 󱅁
					changedelete = { text = "󰱞" },
					untracked = { text = "󰰧" },
				},
			})
		end,
	},
	-- Fugitive
	{
		"tpope/vim-fugitive",
	},

	-- For git blame & browse
	{ "dinhhuy258/git.nvim", opts = {} },
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
}
