----------------
----- Core -----
----------------
require("SouLLesSNesSZeN.core.options")
require("SouLLesSNesSZeN.core.keymaps")
require("SouLLesSNesSZeN.core.autocommands")

----------------------
----- Integrated -----
----------------------
require("SouLLesSNesSZeN.integrated.neovide")

-----------------------------------------------------
----- Bootstrap Lazy (Install Packages Manager) -----
-----------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- This has to be set before initializing lazy
vim.g.mapleader = " "

-- Initialize lazy with dynamic loading of anything in the plugins directory
require("lazy").setup({
	-- Theme (Colorscheme)
	require("SouLLesSNesSZeN.colorschemes.solarized-osaka"),
	-- Coding
	{ import = "SouLLesSNesSZeN.plugins.coding" },
	-- Debug
	{ import = "SouLLesSNesSZeN.plugins.debug" },
	-- Editor
	{ import = "SouLLesSNesSZeN.plugins.editor" },
	-- UI
	{ import = "SouLLesSNesSZeN.plugins.ui" },
	-- AI
	{ import = "SouLLesSNesSZeN.plugins.ai" },
	-- Utilities
	{ import = "SouLLesSNesSZeN.plugins.utils" },
	-- LSP
	{ import = "SouLLesSNesSZeN.plugins.lsp" },
})

----------------------------------------------
----- Function to check if a file exists -----
----------------------------------------------
local function file_exists(file)
	local f = io.open(file, "r")
	if f then
		f:close()
		return true
	else
		return false
	end
end

-- Path to the session file
local session_file = ".session.nvim"

-- Check if the session file exists in the current directory
if file_exists(session_file) then
	-- Source the session file
	vim.cmd("source " .. session_file)
end
