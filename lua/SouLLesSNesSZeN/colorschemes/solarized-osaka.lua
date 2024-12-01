return {
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("solarized-osaka").setup({
			transparent = true,
			styles = {
				-- functions = {}
				floats = "transparent",
				sidebars = "transparent",
			},
			sidebars = { "qf", "vista_kind", "terminal", "packer" },
			-- Change the "hint" color to the "orange" color, and make the "error" color bright red
			on_colors = function(colors)
				colors.hint = colors.orange
				colors.error = "#ff0000"
			end,
			-- on_highlights = function(hl, c)
			--   local prompt = "#2d3149"
			-- hl.TelescopeNormal = {
			--   bg = c.bg_dark,
			--   fg = c.fg_dark,
			-- }
			-- hl.TelescopeBorder = {
			--    -- bg = c.bg_dark,
			--   fg = c.yellow500, -- fg = c.bg_dark,
			-- }
			-- hl.TelescopePromptNormal = {
			--   bg = prompt,
			-- }
			-- hl.TelescopePromptBorder = {
			--   bg = prompt,
			--   fg = prompt,
			-- }
			-- hl.TelescopePromptTitle = {
			--   bg = prompt,
			--   fg = prompt,
			-- }
			-- hl.TelescopePreviewTitle = {
			--   bg = c.bg_dark,
			--   fg = c.bg_dark,
			-- }
			-- hl.TelescopeResultsTitle = {
			--   bg = c.bg_dark,
			--   fg = c.bg_dark,
			-- }
			-- end,
			-- vim.cmd([[colorscheme solarized-osaka]]),
		})
		vim.cmd([[colorscheme solarized-osaka]])
		vim.opt.termguicolors = true
		vim.opt.winblend = 0
		vim.opt.laststatus = 2
	end,
}
