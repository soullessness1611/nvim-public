----------------
----- Core -----
----------------
require("SouLLesSNesSZeN.core.options")
require("SouLLesSNesSZeN.core.keymaps")
require("SouLLesSNesSZeN.core.autocommands")

-----------------------
----- Integration -----
-----------------------
require("SouLLesSNesSZeN.integrated.neovide")

----------------------------------------------------
----- Bootstrap Lazy (Install Package Manager) -----
----------------------------------------------------
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
	------------------------------------
	----- Import your plugins here -----
	------------------------------------
	-- Theme import
	require("SouLLesSNesSZeN.colorschemes.solarized-osaka"),
	-- Editor import
	require("SouLLesSNesSZeN.plugins.editor.telescope"),
	require("SouLLesSNesSZeN.plugins.editor.autopairs"),
	require("SouLLesSNesSZeN.plugins.editor.comment"),
	require("SouLLesSNesSZeN.plugins.editor.format-on-save"),
	require("SouLLesSNesSZeN.plugins.editor.git-conflict"),
	require("SouLLesSNesSZeN.plugins.editor.hop"),
	require("SouLLesSNesSZeN.plugins.editor.incRename"),
	require("SouLLesSNesSZeN.plugins.editor.moveline"),
	require("SouLLesSNesSZeN.plugins.editor.nvim-surround"),
	require("SouLLesSNesSZeN.plugins.editor.reactive"),
	require("SouLLesSNesSZeN.plugins.editor.todo-comment"),
	require("SouLLesSNesSZeN.plugins.editor.ufo"),
	-- Coding import
	require("SouLLesSNesSZeN.plugins.coding.nvim-treesitter"),
	require("SouLLesSNesSZeN.plugins.coding.nvim-cmp"),
	require("SouLLesSNesSZeN.plugins.coding.action-preview"),
	require("SouLLesSNesSZeN.plugins.coding.codesnap"),
	require("SouLLesSNesSZeN.plugins.coding.colorizer"),
	require("SouLLesSNesSZeN.plugins.coding.colortils"),
	require("SouLLesSNesSZeN.plugins.coding.document-color"),
	require("SouLLesSNesSZeN.plugins.coding.null-ls"),
	require("SouLLesSNesSZeN.plugins.coding.quick-code-runner"),
	require("SouLLesSNesSZeN.plugins.coding.tailwindcss-colorizer-cmp"),
	require("SouLLesSNesSZeN.plugins.coding.treesj"),
	require("SouLLesSNesSZeN.plugins.coding.code-runner"),
	-- LSP Import
	require("SouLLesSNesSZeN.plugins.lsp.lsp"),
	require("SouLLesSNesSZeN.plugins.lsp.lspsaga"),
	require("SouLLesSNesSZeN.plugins.lsp.lsp_lines"),
	-- UI Import
	require("SouLLesSNesSZeN.plugins.ui.barbecue"),
	require("SouLLesSNesSZeN.plugins.ui.bufferline"),
	require("SouLLesSNesSZeN.plugins.ui.hlchunk"),
	require("SouLLesSNesSZeN.plugins.ui.incline"),
	require("SouLLesSNesSZeN.plugins.ui.indent-blankline"),
	require("SouLLesSNesSZeN.plugins.ui.lualine"),
	require("SouLLesSNesSZeN.plugins.ui.noice"),
	require("SouLLesSNesSZeN.plugins.ui.nvim-tree"),
	require("SouLLesSNesSZeN.plugins.ui.neo-tree"),
	require("SouLLesSNesSZeN.plugins.ui.outline"),
	require("SouLLesSNesSZeN.plugins.ui.which-key"),
	require("SouLLesSNesSZeN.plugins.ui.zen-twilight"),
	-- Utilities Import
	require("SouLLesSNesSZeN.plugins.utils.bracey"),
	require("SouLLesSNesSZeN.plugins.utils.cellular-automaton"),
	require("SouLLesSNesSZeN.plugins.utils.diffview"),
	require("SouLLesSNesSZeN.plugins.utils.git"),
	require("SouLLesSNesSZeN.plugins.utils.goto-preview"),
	require("SouLLesSNesSZeN.plugins.utils.live-server"),
	require("SouLLesSNesSZeN.plugins.utils.markdown-preview"),
	require("SouLLesSNesSZeN.plugins.utils.search"),
	require("SouLLesSNesSZeN.plugins.utils.wakatime"),
	-- Debug Import
	require("SouLLesSNesSZeN.plugins.debug.nvim-dap-ui"),
	require("SouLLesSNesSZeN.plugins.debug.nvim-dap-virtual-text"),
	-- AI Import
	require("SouLLesSNesSZeN.plugins.ai.copilot"),
	require("SouLLesSNesSZeN.plugins.ai.copilotchat"),
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
