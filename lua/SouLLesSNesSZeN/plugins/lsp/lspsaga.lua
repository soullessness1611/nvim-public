return {
	"nvimdev/lspsaga.nvim",
	event = "VeryLazy", -- "InsertEnter",
	config = function()
		local lspsaga = require("lspsaga")
		lspsaga.setup({ -- defaults ...
			ui = {
				-- This option only works in Neovim 0.9
				title = true,
				-- Border type can be single, double, rounded, solid, shadow.
				border = "rounded",
				winblend = 0,
				expand = "",
				collapse = "",
				code_action = "", -- ""
				incoming = " ",
				outgoing = " ",
				hover = "  ",
				kind = {},
			},
			debug = false,
			use_saga_diagnostic_sign = true,
			-- diagnostic sign
			error_sign = "",
			warn_sign = "",
			hint_sign = "",
			infor_sign = "",
			diagnostic_header_icon = "   ",
			-- code action title icon
			code_action_icon = "", -- ""
			code_action_prompt = {
				enable = true,
				sign = true,
				sign_priority = 40,
				virtual_text = true,
			},
			finder_definition_icon = "  ",
			finder_reference_icon = "  ",
			max_preview_lines = 10,
			finder_action_keys = {
				open = "o",
				vsplit = "s",
				split = "i",
				quit = "q",
				scroll_down = "<C-f>",
				scroll_up = "<C-b>",
			},
			code_action_keys = {
				quit = "q",
				exec = "<CR>",
			},
			rename_action_keys = {
				quit = "<C-c>",
				exec = "<CR>",
			},
			definition_preview_icon = "  ",
			border_style = "single",
			rename_prompt_prefix = "➤",
			rename_output_qflist = {
				enable = false,
				auto_open_qflist = false,
			},
			server_filetype_map = {},
			diagnostic_prefix_format = "%d. ",
			diagnostic_message_format = "%m %c",
			highlight_prefix = false,
			diagnostic = {
				borderFollow = true,
				diagnosticOnlyCurrent = false,
				showCodeAction = true,
			},
		})

		--- In lsp attach function
		local map = vim.api.nvim_buf_set_keymap
		map(0, "n", "gr", "<cmd>Lspsaga rename<cr>", { silent = true, noremap = true })
		map(0, "n", "gx", "<cmd>Lspsaga code_action<cr>", { silent = true, noremap = true })
		map(0, "x", "gx", ":<c-j>Lspsaga range_code_action<cr>", { silent = true, noremap = true })
		map(0, "n", "K", "<cmd>Lspsaga hover_doc<cr>", { silent = true, noremap = true })
		map(0, "n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", { silent = true, noremap = true })
		map(0, "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", { silent = true, noremap = true })
		map(0, "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { silent = true, noremap = true })

		-- local opts = { noremap = true, silent = true }
		--vim.keymap.set('n', 'n', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
		--vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
		--vim.keymap.set('n', 'gd', '<cmd>Lspsaga lsp_finder<CR>', opts)
		--vim.keymap.set('n', '<C-k>', '<cmd>Lspsaga signature_help<CR>', opts)
		--vim.keymap.set('n', 'gr', '<cmd>Lspsaga rename<CR>', opts)

		local opts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_type_definition<CR>", opts)
		vim.keymap.set("n", "gt", "<cmd>Lspsaga goto_definition<CR>", opts)
		vim.keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references
		vim.keymap.set("n", "gd", "<cmd>Lspsaga preview_definition<CR>", opts) -- see definition and make edits in window
		vim.keymap.set("n", ";D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
		vim.keymap.set("n", ";d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
		vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
		vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
		vim.keymap.set("n", ";.", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
		vim.keymap.set("n", "<S-t>", "<cmd>Lspsaga term_toggle<CR>", opts) -- open terminal in buffer (if supported)
	end,
}
