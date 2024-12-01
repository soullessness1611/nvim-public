return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {},
		config = function()
			-- Color hightlight suggestions for copilot
			vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#83a598" })

			-- -- disable Tab as the accept key
			-- vim.g.copilot_no_tab_map = true
			-- vim.g.copilot_assume_mapped = true
			-- -- vim.g.copilot_tab_fallback = ""

			-- enable specific language
			vim.g.copilot_filetypes = {
				python = true,
				go = true,
				javascript = true,
				javascriptreact = true,
				typescript = true,
				typescriptreact = true,
				html = true,
				css = true,
				scss = true,
				markdown = true,
				yaml = true,
				json = true,
				lua = true,
				rust = true,
				ruby = true,
				sql = true,
				graphql = true,
				docker = true,
				shell = true,
				vim = true,
				xml = true,
				fish = true,
				toml = true,
				php = true,
				java = true,
				kotlin = true,
				c = true,
				cpp = true,
				objc = true,
			}

			-- Setup copilot and bindingkeymaps
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = true,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<S-CR>",
					},
					layout = {
						position = "right",
						ratio = 0.4,
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<C-y>",
						accept_word = "<C-w>",
						accept_line = false,
						next = "<Down>",
						prev = "<Up>",
						dismiss = "<Esc>",
					},
				},
				filetypes = vim.g.copilot_filetypes,
				copilot_node_command = "node",
				server_opts_overrides = {
					settings = {
						advanced = {
							inlineSuggestionCount = 1,
						},
					},
				},
			})

			-- map copilot toggle key
			vim.api.nvim_create_user_command("CopilotToggle", function()
				vim.g.copilot_enabled = not vim.g.copilot_enabled
				vim.cmd("Copilot status")
			end, { nargs = 0 })

			vim.keymap.set("n", "<leader>cp", "<cmd>CopilotToggle<cr>", { noremap = true })

			-- -- map accept to another key
			-- vim.keymap.set('i', '<Right>', 'copilot#Accept("<CR>")',
			-- { expr = true, silent = true, noremap = true, replace_keycodes = false })
			-- vim.keymap.set('i', '<C-Down>', '<Plug>(copilot-next)', { silent = true, noremap = true })
			-- vim.keymap.set('i', '<C-UP>', '<Plug>(copilot-previous)', { silent = true, noremap = true })
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		opts = {},
	},
}
