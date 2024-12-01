return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
		{
			"linrongbin16/lsp-progress.nvim",
			event = { "VimEnter" },
			dependencies = {
				"nvim-tree/nvim-web-devicons",
				config = function()
					require("lsp-progress").setup()
				end,
			},
		},
		{
			-- Battery Monitoring conbination with Lualine
			"justinhj/battery.nvim",
			dependencies = {
				{ "kyazdani42/nvim-web-devicons" },
				{ "nvim-lua/plenary.nvim" },
			},
		},
	},
	config = function()
		--Ensuring Lualine Is Working
		local status, lualine = pcall(require, "lualine")
		if not status then
			print("Lualine Is Not Working")
			return
		end

		-- Battery setup for lualine
		local battery = require("battery")
		battery.setup({
			update_rate_seconds = 30, -- Number of seconds between checking battery status
			show_status_when_no_battery = true, -- Don't show any icon or text when no battery found (desktop for example)
			show_plugged_icon = true, -- If true show a cable icon alongside the battery icon when plugged in
			show_unplugged_icon = true, -- When true show a diconnected cable icon when not plugged in
			show_percent = true, -- Whether or not to show the percent charge remaining in digits
			vertical_icons = true, -- When true icons are vertical, otherwise shows horizontal battery icon
			multiple_battery_selection = 1, -- Which battery to choose when multiple found. "max" or "maximum", "min" or "minimum" or a number to pick the nth battery found (currently linux acpi only)
		})

		-- Colors highlight lists
		local colors = {
			bg = "#202328",
			fg = "#bbc2cf",
			yellow = "#ECBE7B",
			cyan = "#008080",
			darkblue = "#081633",
			green = "#98be65",
			orange = "#FF8800",
			violet = "#a9a1e1",
			magenta = "#c678dd",
			blue = "#51afef",
			red = "#ec5f67",
		}

		local gruvbox_colors = {
			fg = "#ebdbb2",
			fg2 = "#a89984",
			bg = "#282828",
			bg2 = "#3c3836",
			black = "#282828",
			red = "#fb4934",
			green = "#b8bb26",
			blue = "#83a598",
			yellow = "#fe8019",
		}

		local tokyodark_colors = {
			fg = "#a0a8cd",
			bg = "#111219",
			bg2 = "#1a1b27",
			fg2 = "#4a5057",
			black = "#06080a",
			red = "#ee6d85",
			yellow = "#d7a65f",
			green = "#95c561",
			blue = "#7199ee",
		}

		local minimal_colors = {
			fg = "#DFE0EA",
			fg2 = "#6e7380",
			bg = "#191b20",
			bg2 = "#21252d",
			black = "#16181d",
			red = "#E85A84",
			green = "#94DD8E",
			blue = "#7eb7e6",
			yellow = "#E9D26C",
		}

		local kanagawa_colors = {
			fg = "#DCD7BA",
			fg2 = "#727169",
			bg = "#1f1f28",
			bg2 = "#2a2a37",
			black = "#16161d",
			green = "#98bb6c",
			yellow = "#ffa066", -- yellow/orange
			red = "#ff5d62",
			blue = "#7E9Cd8",
		}

		-- Integrate battery status with lualine
		local nvimbattery = {
			function()
				return require("battery").get_status_line()
			end,
			-- color = { fg = "#073542", bg = "#4BAF4F"},
		}

		---------------------------------
		--------- Git status ------------
		---------------------------------
		local function git_status()
			local git_head = vim.fn["fugitive#head"]()
			local git_branch = vim.fn["fugitive#statusline"]()
			local git_status = vim.fn["fugitive#status"]()

			-- Get the number of changed files in the working directory
			local working_changed = git_status:match("+[^%s]+") or ""
			local working_string = working_changed ~= "" and "+" or ""

			-- Get the number of changed files in the staging area
			local staging_changed = git_status:match("%%[^%s]+") or ""
			local staging_string = staging_changed ~= "" and "●" or ""

			-- Get the stash count
			local stash_count = vim.fn.systemlist("git stash list") or {}
			local stash_string = #stash_count > 0 and " " .. #stash_count .. " " or ""

			return string.format(
				"%s %s %s %s %s %s %s",
				git_head,
				git_branch,
				working_string,
				working_changed,
				staging_string,
				staging_changed,
				stash_string
			)
		end

		---------------------------------
		------ Conditions Optional-------
		---------------------------------
		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 40
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}

		---------------------------------
		---- Filename colors status -----
		---------------------------------
		local custom_fname = require("lualine.components.filename"):extend()
		local highlight = require("lualine.highlight")
		local default_status_colors = { saved = "#0b6223", modified = "#8d4004" }

		function custom_fname:init(options)
			custom_fname.super.init(self, options)
			self.status_colors = {
				saved = highlight.create_component_highlight_group(
					{ bg = default_status_colors.saved },
					"filename_status_saved",
					self.options
				),
				modified = highlight.create_component_highlight_group(
					{ bg = default_status_colors.modified },
					"filename_status_modified",
					self.options
				),
			}
			if self.options.color == nil then
				self.options.color = ""
			end
		end

		function custom_fname:update_status()
			local data = custom_fname.super.update_status(self)
			data = highlight.component_format_highlight(
				vim.bo.modified and self.status_colors.modified or self.status_colors.saved
			) .. data
			return data
		end

		-------------------------------------------------
		---- Truncating components in smaller window ----
		-------------------------------------------------
		--- @param trunc_width number trunctates component when screen width is less then trunc_width
		--- @param trunc_len number truncates component to trunc_len number of chars
		--- @param hide_width number hides component when window width is smaller then hide_width
		--- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
		--- return function that can format the component accordingly
		local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
			return function(str)
				local win_width = vim.fn.winwidth(0)
				if hide_width and win_width < hide_width then
					return ""
				elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
					return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
				end
				return str
			end
		end

		---------------------------------
		----- Keymap Short Name --------
		---------------------------------
		local function keymap()
			if vim.opt.iminsert:get() > 0 and vim.b.keymap_name then
				return "⌨ " .. vim.b.keymap_name
			end
			return ""
		end
		------------------------------ Dependency ----------------------------------
		local function getWordsV2()
			local wc = vim.fn.wordcount()
			if wc["visual_words"] then -- text is selected in visual mode
				return wc["visual_words"] .. " Words/" .. wc["visual_chars"] .. " Chars (Vis)"
			else -- all of the document
				return wc["words"] .. " Words"
			end
		end

		---------------------------------
		--------- LSP Progress ------------
		---------------------------------
		--local function LspStatus()
		--    return require("lsp-progress").progress({
		--        format = function(messages)
		--            return #messages > 0 and table.concat(messages, " ") or ""
		--        end,
		--    })
		--end
		--
		--local function lspicon()
		--    return " LSP"
		--end

		---------------------------------
		--------- Get LSP Server --------
		---------------------------------
		local lsp_server = function()
			local msg = "No LSP"
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
			local clients = vim.lsp.get_active_clients()
			if next(clients) == nil then
				return msg
			end
			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return client.name
				end
			end
			return msg
		end

		---------------------------------
		--------- Lualune Setup ---------
		---------------------------------
		lualine.setup({
			options = {
				icons_enabled = true,
				-- theme = "solarized_dark",
				theme = "auto",
				--theme = "tokyonight",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = {},
				globalstatus = true,
			},
			sections = {
				lualine_a = { { "mode", icon = "" } },
				lualine_b = {
					{
						"branch",
						icon = " ",
						color = { fg = "#ffffff40", bg = "#563d7c" },
						separator = { right = "" },
					},
					{
						"diff",
						symbols = {
							added = " ",
							modified = "󱗜 ", -- 
							-- modified = ' ',
							removed = " ",
						},
						diff_color = {
							added = {
								fg = "#0b6623",
							},
							modified = {
								fg = "#8d4004",
							},
							removed = {
								fg = "#000000",
							},
						},
						cond = conditions.hide_in_width,
					},
					{
						"diagnostics",
						sources = { "nvim_lsp", "nvim_diagnostic", "nvim_workspace_diagnostic" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
						diagnostics_color = {
							error = { fg = "#900009" },
							warn = { fg = "#8d4004" },
							info = { fg = "#1f63b4" },
							hint = { fg = "#0c0908" },
						},
						cond = conditions.hide_in_width,
					},
				},
				lualine_c = {
					{
						"filetype",
						icon_only = false,
						separator = "",
						padding = { left = 1, right = 0 },
					},
					{ "filesize", cond = conditions.buffer_not_empty },
					{
						"filename",
						icon = "",
						cons = conditions.buffer_not_empty,
						file_status = true, -- displays file status (readonly status, modified status)
						path = 4, -- 0 = just filename, 1 = relative path, 2 = absolute path
					}, --lspicon,LspStatus
				},
				-- lualine_x = { { "encoding", fmt = string.upper }, 'fileformat' },
				lualine_x = {
					{
						require("noice").api.status.search.get,
						cond = require("noice").api.status.search.has,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_y = {
					nvimbattery,
					{
						lsp_server,
						icon = "",
						-- }, "os.date('%a %T')", 'data',
					},
					"data",
					"require'lsp-status'.status()",
				},
				lualine_z = { "location", "progress" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"filename",
						file_status = true, -- displays file status (readonly status, modified status)
						path = 4, -- 0 = just filename, 1 = relative path, 2 = absolute path
					},
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = { "fugitive" },
		})
	end,
}
