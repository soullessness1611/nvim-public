return {
	"turbio/bracey.vim",
	event = "VeryLazy",
	config = function()
		vim.g["bracey_server_allow_remote_connections"] = 1
		vim.g["bracey_server_port"] = "9999"
		vim.g["bracey_server_path"] = "http://localhost"
	end,
}
