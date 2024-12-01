return {
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			local status, telescope = pcall(require, "telescope")
			if not status then
				return
			end
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")

			local function telescope_buffer_dir()
				return vim.fn.expand("%:p:h")
			end

			local fb_actions = require("telescope").extensions.file_browser.actions

			telescope.setup({
				pickers = {
					colorscheme = {
						enable_preview = true,
					},
				},
				defaults = {
					mappings = {
						n = {
							["q"] = actions.close,
						},
					},
				},
				extensions = {
					file_browser = {
						theme = "dropdown",
						-- disables netrw and use telescope-file-browser in its place
						hijack_netrw = true,
						mappings = {
							-- your custom insert mode mappings
							["i"] = {
								["<C-w>"] = function()
									vim.cmd("normal vbd")
								end,
							},
							["n"] = {
								-- your custom normal mode mappings
								["N"] = fb_actions.create,
								["h"] = fb_actions.goto_parent_dir,
								["/"] = function()
									vim.cmd("startinsert")
								end,
							},
						},
					},
				},
			})
			telescope.load_extension("file_browser")

			vim.keymap.set("n", "<leader>ff", function()
				telescope.extensions.file_browser.file_browser({
					path = "%:p:h",
					cwd = telescope_buffer_dir(),
					respect_gitignore = false,
					hidden = true,
					grouped = true,
					previewer = false,
					initial_mode = "normal",
					layout_config = { height = 40 },
				})
			end)

			-- Make Telescope use the same background(Transparent) as the rest of Neovim
			vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none", fg = "#6c71c4" }) -- #9457E8 #BE00FE #BC13FE
			vim.api.nvim_set_hl(0, "TelescopeTitle", { bg = "none" })

			-- keymaps
			vim.keymap.set("n", ";f", function()
				builtin.find_files({
					no_ignore = false,
					hidden = true,
				})
			end)
			vim.keymap.set("n", ";rrr", function()
				builtin.live_grep()
			end)
			vim.keymap.set("n", "\\\\", function()
				builtin.buffers()
			end)
			vim.keymap.set("n", ";t", function()
				builtin.help_tags()
			end)
			vim.keymap.set("n", ";;", function()
				builtin.resume()
			end)
			vim.keymap.set("n", ";e", function()
				builtin.diagnostics()
			end)
			vim.keymap.set("n", "<leader>t", function()
				builtin.colorscheme()
			end)
			vim.keymap.set("n", ";o", function()
				builtin.oldfiles()
			end)
			vim.keymap.set("n", ";b", function()
				builtin.builtin()
			end)
			vim.keymap.set("n", ";c", function()
				builtin.commands()
			end)
			vim.keymap.set("n", ";jm", function()
				builtin.jumplist()
			end)
			vim.keymap.set("n", ";gs", function()
				builtin.grep_string()
			end)
			vim.keymap.set("n", ";cb", function()
				builtin.current_buffer_fuzzy_find()
			end)
			vim.keymap.set("n", ";km", function()
				builtin.keymaps()
			end)
		end,
	},
}
