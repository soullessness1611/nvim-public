return {
	"CRAG666/code_runner.nvim",
	config = function()
		--Ensuring Code-Runner Is Working
		local status, cr = pcall(require, "code_runner")
		if not status then
			print("Code-Runner Is Not Working")
		end

		--Code-Runner Setup
		cr.setup({
			filetype = {
				typescript = "tsc $fileName && node $fileNameWithoutExt.js",
				rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
				-- python = "python3 -u",
				python = "python3 -u",
				-- python = "wslview $fileName && python3 $fileName",  -- For WSL
			},
			mode = "float",
			float = {
				close_key = "q",
				border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
				-- border = 'single',
				-- border = { "☽", "-", "☾", "┋", "☾", "-", "☽", "┋"},
				-- border = { '▗', '▄', '▖', '▌', '▘', '▀', '▝', '▐' },
				blend = 0,
			},
		})
	end,
}
