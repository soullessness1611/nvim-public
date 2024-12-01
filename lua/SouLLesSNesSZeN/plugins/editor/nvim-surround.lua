return {
	"kylechui/nvim-surround",
	version = "*",
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({})
		vim.cmd("let g:loaded_surround = 1")
	end,
}
