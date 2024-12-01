-- install without yarn or npm
return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function(plugin)
		if vim.fn.executable("npx") then
			vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install && npm install")
		else
			vim.cmd([[Lazy load markdown-preview.nvim]])
			vim.fn["mkdp#util#install"]()
		end
	end,
	config = function()
		local g = vim.g
		g.mkdp_auto_start = 1
		g.mkdp_auto_close = 1
		g.mkdp_page_title = "${name}.md"
		g.mkdp_preview_options = {
			disable_sync_scroll = 0,
			disable_filename = 1,
		}
	end,
}
