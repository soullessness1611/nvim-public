-- For conciseness
local opts = { noremap = true, silent = true }

-- Copy to clipboard
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>Y", '"+yg_', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>yy", '"+yy', { noremap = true, silent = true })
-- Past from clipboard
vim.keymap.set("n", "<leader>p", '"+p', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>P", '"+P', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>p", '"+p', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>P", '"+P', { noremap = true, silent = true })

-- Keymaps for better default experience
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "$")
-- Open file
vim.keymap.set("n", "<C-o>", ":edit . <Return>", { silent = true, noremap = true, desc = "Open file" })
--Getting Rid Of Search Highlighting
vim.keymap.set("n", ";m", ":noh <Return>", { silent = true })
-- Toggle Cursorline
vim.keymap.set("n", "tc", ":set cursorline!<cr>", { noremap = true })
-- motions
vim.keymap.set("i", "<A-h>", "<Left>", { noremap = true })
vim.keymap.set("i", "<A-l>", "<Right>", { noremap = true })
vim.keymap.set("i", "<C-o>", "<Esc>A", { noremap = true })
vim.keymap.set("i", "<C-l>", "<Esc>ww", { noremap = true })
vim.keymap.set("i", "<A-9>", "<Esc>I", { noremap = true })
vim.keymap.set("n", "<C-g>", "<Esc>ggo", { noremap = true })
vim.keymap.set("i", "<A-G>", "<Esc>Go", { noremap = true })
vim.keymap.set("n", "<leader>a", "ggVG", { noremap = true })
vim.keymap.set("n", "<leader>da", "ggVGd", { noremap = true })
-- Map [[ and ]] to move to start and end of function
vim.keymap.set("n", "[[", "?{<CR>w99[{", { noremap = true })
vim.keymap.set("n", "][", "/}<CR>b99]}", { noremap = true })
vim.keymap.set("n", "]]", "j0[[%/{<CR>", { noremap = true })
vim.keymap.set("n", "[]", "k$][%?}<CR>", { noremap = true })
-- Delete a word backwards
vim.keymap.set("n", "dw", 'vb"_d')

-- -- Normal-mode commands
-- vim.keymap.set("n", "<A-j>", ":MoveLine(1)<CR>", opts)
-- vim.keymap.set("n", "<A-k>", ":MoveLine(-1)<CR>", opts)
-- vim.keymap.set("n", "<A-h>", ":MoveHChar(-1)<CR>", opts)
-- vim.keymap.set("n", "<A-l>", ":MoveHChar(1)<CR>", opts)
-- vim.keymap.set("n", "<localleader>wf", ":MoveWord(1)<CR>", opts)
-- vim.keymap.set("n", "<localleader>wb", ":MoveWord(-1)<CR>", opts)
--
-- -- Visual-mode commands
-- vim.keymap.set("v", "<A-j>", ":MoveBlock(1)<CR>", opts)
-- vim.keymap.set("v", "<A-k>", ":MoveBlock(-1)<CR>", opts)
-- vim.keymap.set("v", "<A-h>", ":MoveHBlock(-1)<CR>", opts)
-- vim.keymap.set("v", "<A-l>", ":MoveHBlock(1)<CR>", opts)

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Allow moving the cursor through wrapped lines with j, k
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- clear highlights
vim.keymap.set("n", "<Esc>", ":noh<CR>", opts)

-- save file
-- vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file without auto-formatting
-- vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- quit file
-- vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", ":Bdelete!<CR>", opts) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- Increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>", opts) -- increment
vim.keymap.set("n", "<leader>-", "<C-x>", opts) -- decrement

-- Window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- close current split window

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Press jk fast to exit insert mode
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("i", "kj", "<ESC>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Replace word under cursor
vim.keymap.set("n", "<leader>j", "*``cgn", opts)

-- Explicitly yank to system clipboard (highlighted and entire row)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set("n", "<leader>do", function()
	diagnostics_active = not diagnostics_active

	if diagnostics_active then
		vim.diagnostic.enable(0)
	else
		vim.diagnostic.disable(0)
	end
end)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Save and load session
vim.keymap.set("n", "<leader>ss", ":mksession! .session.vim<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>sl", ":source .session.vim<CR>", { noremap = true, silent = false })

-----------------------------
------ Plugins keymaps ------
-----------------------------
vim.keymap.set(
	"n",
	"fml",
	"<cmd>CellularAutomaton make_it_rain<cr>",
	{ noremap = true, silent = true, desc = "Make it Rain" }
)

-- Hop EasyMotion keymapping
vim.keymap.set("n", ";;s", ":HopAnywhere<cr>", { noremap = true, silent = true, desc = "Hop Anywhere" })
vim.keymap.set("n", ";s", ":HopWord<cr>", { noremap = true, silent = true, desc = "Hop Word" })

-- Go to preview keymapping
vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
vim.cmd("nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>")

-- Outline keymapping
vim.keymap.set("n", "<localleader>o", ":Outline<cr>", { silent = true })
vim.keymap.set("n", "<localleader>br", ":belowright OutlineOpen<cr>", { silent = true })
vim.keymap.set("n", "<localleader>al", ":aboveleft OutlineOpen<cr>", { silent = true })

-- Format keymapping
vim.keymap.set("n", "<leader>f", ":Format<cr>", { silent = true, desc = "Format on Save" })

-- Treesitter-context keymapping
vim.keymap.set("n", "<leader>tc", ":TSContextToggle<cr>", { silent = true, desc = "Toggle Treesitter Context" })

-- neo-tree keymapping
vim.keymap.set("n", "<C-t>", ":Neotree<cr>", { silent = true })

-- Diffview keymapping
vim.keymap.set("n", "<leader>dv", ":DiffviewOpen<cr>", { silent = true, desc = "Open Diffview" })

-- CopiloChat keymapping
vim.keymap.set("n", ";cc", ":CopilotChat<cr>", { silent = true, desc = "Open CopiloChat" })

-- CodeRunner keymapping
vim.keymap.set("n", ";cr", ":RunCode<cr>", { silent = true, desc = "Run Code" })
