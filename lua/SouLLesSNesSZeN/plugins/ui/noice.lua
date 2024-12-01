return {
	"folke/noice.nvim",
	event = "VimEnter",
	dependencies = {
		"MunifTanjim/nui.nvim",
		-- Optional:
		-- `nvim-notify` is only needed if you want to use the notification view.
		-- If not available, we use `mini` as the fallback
		{
			"rcarriga/nvim-notify",
			config = function()
				-- Ensuring Notify it's working
				local status, notify = pcall(require, "notify")
				if not status then
					print("Notify not working")
					return
				end

				notify.setup({
					background_colour = "#000000",
					fps = 30,
					icons = {
						DEBUG = "",
						ERROR = "",
						INFO = "",
						TRACE = "✎",
						WARN = "",
					},
					level = 2,
					minimum_width = 50,
					render = "default",
					stages = "fade_in_slide_out",
					timeout = 2000,
					top_down = false,
				})

				vim.notify = notify

				-- Highlights
				vim.cmd([[
    highlight NotifyERRORBorder guifg=#8A1F1F
    highlight NotifyWARNBorder guifg=#79491D
    highlight NotifyINFOBorder guifg=#4F6752
    highlight NotifyDEBUGBorder guifg=#8B8B8B
    highlight NotifyTRACEBorder guifg=#4F3552
    highlight NotifyERRORIcon guifg=#F70067
    highlight NotifyWARNIcon guifg=#F79000
    highlight NotifyINFOIcon guifg=#A9FF68
    highlight NotifyDEBUGIcon guifg=#8B8B8B
    highlight NotifyTRACEIcon guifg=#D484FF
    highlight NotifyERRORTitle  guifg=#F70067
    highlight NotifyWARNTitle guifg=#F79000
    highlight NotifyINFOTitle guifg=#A9FF68
    highlight NotifyDEBUGTitle  guifg=#8B8B8B
    highlight NotifyTRACETitle  guifg=#D484FF
    highlight link NotifyERRORBody Normal
    highlight link NotifyWARNBody Normal
    highlight link NotifyINFOBody Normal
    highlight link NotifyDEBUGBody Normal
    highlight link NotifyTRACEBody Normal
]])
			end,
		},
	},
	config = function()
		-- Ensuring Noice is working
		local status, noice = pcall(require, "noice")
		if not status then
			print("Noice is not working")
			return
		end

		-- Noice Setup
		noice.setup({
			-- Override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			-- you can enable a preset for easier configuration
			preset = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = true, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
			lsp = {
				documentation = {
					view = "hover",
					opts = { -- lsp_docs settings
						lang = "markdown",
						replace = true,
						render = "plain",
						format = { "{message}" },
						position = { row = 2, col = 2 },
						size = {
							max_width = math.floor(0.8 * vim.api.nvim_win_get_width(0)),
							max_height = 15,
						},
						border = {
							style = "rounded",
						},
						win_options = {
							concealcursor = "n",
							conceallevel = 3,
							winhighlight = {
								Normal = "CmpPmenu",
								FloatBorder = "DiagnosticSignInfo",
							},
						},
					},
				},
			},
		})

		vim.keymap.set("n", "<localleader>nl", function()
			require("noice").cmd("last")
		end)

		vim.keymap.set("n", "<localleader>nh", function()
			require("noice").cmd("history")
		end)

		vim.keymap.set({ "n", "i", "s" }, "<C-j>", function()
			if not require("noice.lsp").scroll(4) then
				return "<C-j>"
			end
		end, { silent = true, expr = true })

		vim.keymap.set({ "n", "i", "s" }, "<C-k>", function()
			if not require("noice.lsp").scroll(-4) then
				return "<C-k>"
			end
		end, { silent = true, expr = true })

		-------------------------------------------
		-- Fixing the issue with noice (Ram hiher)
		-------------------------------------------
		-- local nsn = vim.api.nvim_get_namespaces()
		--
		-- local counts = {}
		--
		-- for name, ns in pairs(nsn) do
		-- 	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		-- 		local count = #vim.api.nvim_buf_get_extmarks(buf, ns, 0, -1, {})
		-- 		if count > 0 then
		-- 			counts[#counts + 1] = {
		-- 				name = name,
		-- 				buf = buf,
		-- 				count = count,
		-- 				ft = vim.bo[buf].ft,
		-- 			}
		-- 		end
		-- 	end
		-- end
		-- table.sort(counts, function(a, b)
		-- 	return a.count > b.count
		-- end)
		-- vim.print(counts)
	end,
}
