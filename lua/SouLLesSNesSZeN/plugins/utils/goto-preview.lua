return {
	"rmagatti/goto-preview",
	event = "VeryLazy",
	config = function()
		local status_goto, gotop = pcall(require, "goto-preview")
		if not status_goto then
			print("Goto preview not added")
		end
		gotop.setup({
			width = 90,
			height = 13,
			default_mappings = false,
			debug = false,
			opacity = nil,
			post_open_hook = nil,
		})
	end,
}
