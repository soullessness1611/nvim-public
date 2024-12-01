return {
	"VonHeikemen/searchbox.nvim",
	event = "VeryLazy",
	config = function()
		--Ensuring Searchbox Is Working
		local status, searchbox = pcall(require, "searchbox")
		if not status then
			print("Searchbox Is Not Working")
			return
		end

		--Searchbox etup
		searchbox.setup({})

		--Keybinds
		vim.keymap.set("n", ";rr", ":SearchBoxIncSearch<CR>", { silent = true })
		vim.keymap.set("n", ";rp", ":SearchBoxReplace<CR>", { silent = true })
	end,
	dependencies = {
		{
			"justinmk/vim-sneak",
			event = "VeryLazy",
			config = function()
				-- Sneak Setting
				vim.cmd([[ let g:sneak#label = 1 ]])
				vim.g["sneak#label"] = 1
			end,
		},
		{
			"cshuaimin/ssr.nvim",
			module = "ssr",
			-- Calling setup is optional.
			config = function()
				require("ssr").setup({
					border = "rounded",
					min_width = 50,
					min_height = 5,
					max_width = 120,
					max_height = 25,
					adjust_window = true,
					keymaps = {
						close = "q",
						next_match = "n",
						prev_match = "N",
						replace_confirm = "<cr>",
						replace_all = "<localleader><cr>",
					},
				})
			end,
		},
	},
}
