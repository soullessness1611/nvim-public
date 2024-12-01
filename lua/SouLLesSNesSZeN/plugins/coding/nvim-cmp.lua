return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"onsails/lspkind-nvim",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"SirVer/ultisnips",
		"quangnguyen30192/cmp-nvim-ultisnips",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",
		"dcampos/cmp-snippy",
		"dcampos/nvim-snippy",
		"honza/vim-snippets",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local status, cmp = pcall(require, "cmp")
		if not status then
			return
		end
		local lspkind = require("lspkind")

		-- require("luasnip").filetype_expand("ruby", { "rails" })

		vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#aaafff", bg = "NONE" })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#ff1493", bg = "NONE" })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#ec5300", bg = "NONE" })

		local blog_types = {
			["Text"] = { symbol = "󰉿" },
			["Method"] = { symbol = "󰆧" },
			["Function"] = { symbol = "󰊕" },
			["Constructor"] = { symbol = "" },
			["Field"] = { symbol = "󰜢" },
			["Variable"] = { symbol = "󰀫" },
			["Class"] = { symbol = "󰠱" },
			["Interface"] = { symbol = "" },
			["Module"] = { symbol = "" },
			["Property"] = { symbol = "󰜢" },
			["Unit"] = { symbol = "󰑭" },
			["Value"] = { symbol = "󰎠" },
			["Enum"] = { symbol = "" },
			["Keyword"] = { symbol = "󰌋" },
			["Snippet"] = { symbol = "" },
			["Color"] = { symbol = "󰏘" },
			["File"] = { symbol = "󰈙" },
			["Reference"] = { symbol = "󰈇" },
			["Folder"] = { symbol = "󰉋" },
			["EnumMember"] = { symbol = "" },
			["Constant"] = { symbol = "󰏿" },
			["Struct"] = { symbol = "󰙅" },
			["Event"] = { symbol = "" },
			["Operator"] = { symbol = "󰆕" },
			["TypeParameter"] = { symbol = "" },
			["Copilot"] = { symbol = "" },
		}

		cmp.setup({
			snippet = {
				expand = function(args)
					-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
					-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.scroll_docs(-4),
				["<C-j>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<TAB>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			}),
			sources = cmp.config.sources({
				-- Snippets Sources
				{ name = "nvim_lsp", priority = 900 },
				{ name = "vsnip", priority = 700 },
				{ name = "luasnip", priority = 800 },
				{ name = "snippy", priority = 600 },
				{ name = "ultisnips", priority = 1000 },
				{ name = "buffer", priority = 400 },
				{ name = "path", priority = 300 },
				-- Copilot Source
				{ name = "copilot", priority = 500 },
			}),
			formatting = {
				-- format = lspkind.cmp_format({ with_text = false, maxwidth = 50 }),
				-- map formatting to lspkind and sources
				-- format = function(entry, vim_item)
				-- 	vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
				-- 	vim_item.menu = entry.source.name
				-- 	-- vim_item.menu = ({
				-- 	-- 	nvim_lsp = " [LSP]",
				-- 	-- 	buffer = " [Buffer]",
				-- 	-- 	path = " [Path]",
				-- 	-- 	copilot = " [Copilot]",
				-- 	-- 	vsnip = "[VSnip]",
				-- 	-- 	luasnip = "[LuaSnip]",
				-- 	-- 	snippy = "[Snippy]",
				-- 	-- 	ultisnips = "[UltiSnips]",
				-- 	-- })[entry.source.name]
				-- 	return vim_item
				-- end,
				---------------------------------------
				-- ### SouLLesSNesSZeN Customize ### --
				---------------------------------------
				format = function(entry, vim_item)
					local kind = blog_types[vim_item.kind]
					if kind then
						vim_item.kind = kind.symbol .. " " .. vim_item.kind
					end
					vim_item.menu = ({
						nvim_lsp = " [LSP]",
						buffer = " [Buffer]",
						path = " [Path]",
						copilot = " [Copilot]",
						vsnip = " [VSnip]",
						luasnip = " [LuaSnip]",
						snippy = " [Snippy]",
						ultisnips = " [UltiSnips]",
					})[entry.source.name]
					return vim_item
				end,
				---------------------------------------
				-- ### Simple default formatting ### --
				---------------------------------------
				-- format = lspkind.cmp_format({ mode = "symbol", max_width = 50, symbol_map = { Copilot = "" } }),
			},
			window = {
				documentation = cmp.config.window.bordered({
					boder = "rounded",
					winhighlight = "NormalFloat:TelescopeNormal,FloatBorder:TelescopeBorder",
				}),
				completion = cmp.config.window.bordered({
					boder = "rounded",
					side_padding = 0,
					col_offset = -3,
					-- winhilight = "Normal:Pemenu, FloatBorder:Pemenu, CursorLine:PemenuThumbm Search:None"
					winhighlight = "Normal:TelescopeNormal,FloatBorder:TelescopeBorder",
				}),
			},
		})

		vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]])
	end,
}
