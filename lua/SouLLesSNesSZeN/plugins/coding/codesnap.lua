return {
	"mistricky/codesnap.nvim",
	build = "make",
	event = "VeryLazy",
	config = function()
		-- Ensure codesnap installed
		local status, codesnap = pcall(require, "codesnap")
		if not status then
			print("codesnap not installed")
			return
		end

		--  Configure codesnap
		codesnap.setup({
			has_breadcrumbs = true,
			show_workspace = true,
			-- bg_color = "#073642", # Solarized base03 color
			watermark = "",
			save_path = "~/Pictures/CodeSnap/",
		})

		-- Kermappings
		vim.api.nvim_set_keymap("x", "<localleader>cc", "<cmd>CodeSnap<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("x", "<localleader>cs", "<cmd>CodeSnapSave<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("x", "<localleader>cl", "<cmd>CodeSnapHighlight<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap(
			"x",
			"<localleader>cls",
			"<cmd>CodeSnapSaveHighlight<CR>",
			{ noremap = true, silent = true }
		)
	end,
}
