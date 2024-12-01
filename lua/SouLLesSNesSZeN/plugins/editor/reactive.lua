return {
	"rasulomaroff/reactive.nvim",
	event = "InsertEnter",
	config = function()
		local status, reactive = pcall(require, "reactive")
		if not status then
			print("reactive not found please install it")
			return
		end

		reactive.setup({
			builtin = {
				cursorline = true,
				cursor = true,
				modemsg = true,
			},
		})
	end,
}
