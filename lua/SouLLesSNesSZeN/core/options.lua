vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions" -- Session Management
vim.o.hlsearch = true -- Set highlight on search
vim.wo.number = true -- Make line number default
vim.o.mouse = "a" -- Enable mouse mode
vim.o.clipboard = "unnamed,unnamedplus" -- Sync clipboard between OS and Neovim
vim.o.breakindent = true -- Enable break indent
vim.o.undofile = true -- Save undo history
vim.o.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search
vim.o.smartcase = true -- smart case
vim.wo.signcolumn = "yes" -- keep signcolumn on by default
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.backup = false -- create a backup file
vim.o.writebackup = false -- if a file is being edited by another program (or was written to file while edititing with another program), it is not allowed to be edited
vim.o.completeopt = "menuone,noselect" -- Set completeopt to have a better completion experience
vim.opt.termguicolors = true -- set termguicolors to enable highlight groups
vim.o.whichwrap = "bs<>[]hl" -- which "horizontal" keys are allowed to travel to prev/next line
vim.o.wrap = false --display lines as one long line
vim.o.linebreak = true -- companion to wrap don't split words
vim.o.scrolloff = 4 -- minimal number of screen lines to keep above and below the cursor
vim.o.sidescrolloff = 8 -- minimal number of secreen columns either side of cursor if wrap is 'false'
vim.o.relativenumber = true -- set relative numbered lines
vim.o.numberwidth = 4 -- set number column width to 2 {defaulr 4}
vim.o.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.o.tabstop = 4 -- insert n spaces for a tab
vim.o.softtabstop = 4 -- Number of spaces that a tab counts for while performing editting operations
vim.o.expandtab = true -- convert tabs to spaces
vim.o.cursorline = false -- highline the current line
vim.o.splitbelow = true -- force all horizontal splits to go below current window
vim.o.splitright = true -- force all vertical splits to go to he right current window
vim.o.swapfile = false -- creates a swapfile
vim.o.smartindent = true -- make indenting smart again
vim.o.showmode = false -- we dont't need to see things like -- INSERT -- anymore
vim.o.showtabline = 2 --always show tabs
vim.o.backspace = "indent,eol,start" -- allow backspace on
vim.o.pumheight = 10 -- popup menu height
vim.o.conceallevel = 0 -- so that `` is visible in markdown files
vim.o.fileencoding = "utf-8" -- the encoding written to a filedj

vim.o.cmdheight = 1 -- more space om the Neovim command line for displaying messages
vim.o.autoindent = true -- copy indent from current line when starting new one
vim.opt.shortmess:append 'c' -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append '-' -- hyphenated words recognized by searches
vim.opt.formatoptions:remove { 'c', 'r', 'o' } -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles' -- separate vim plugins from neovim in case vim still in use

-- CursorLineNr Setting
vim.opt.cursorline = true
-- Auto remove highlight when enter insert mode or leave insert mode
vim.cmd("autocmd InsertEnter * highlight CursorLineNr term=NONE cterm=NONE ctermbg=0 ctermfg=NONE")
vim.cmd("autocmd InsertLeave * highlight CursorLineNr term=NONE cterm=bold ctermbg=236 ctermfg=NONE")
vim.cmd("highlight Pmenu guibg=NONE") -- Pmenu Background
-- Highlight diagnostics in Neovim LSP colorschemes
vim.cmd([[highlight DiagnosticVirtualTextError ctermfg=8]])
vim.cmd([[highlight DiagnosticVirtualTextInfo ctermfg=8]])
vim.cmd([[highlight DiagnosticVirtualTextWarn ctermfg=8]])
vim.cmd([[highlight DiagnosticVirtualTextHint ctermfg=8]])

-- Hilight CursorLine and CursorLine Number
vim.cmd([[highlight CursorLine term=NONE cterm=NONE ctermbg=236 ctermfg=NONE]])
vim.cmd([[hi CursorLineNr cterm=NONE ctermbg=236 ctermfg=7]])

-- toggle cursorline
--vim.api.nvim_set_keymap('n','tc',':set cursorline!<CR>', {noremap = true})

-- How to hightlight markdown heading
vim.cmd([[hi markdownH1 cterm=bold ctermbg=NONE ctermfg=DarkMagenta]])
vim.cmd([[hi markdownH2 cterm=bold ctermbg=NONE ctermfg=DarkMagenta]])
vim.cmd([[hi markdownH3 ctermbg=NONE ctermfg=Magenta]])
vim.cmd([[hi link markdownH4 markdownH3]])
vim.cmd([[hi link markdownH5 markdownH3]])
vim.cmd([[hi link markdownH6 markdownH3]])
vim.cmd([[hi markdownCode ctermbg=8 ctermfg=NONE]])
vim.cmd([[hi markdownCodeBlock ctermbg=8 ctermfg=NONE]])

-- Highlight spellings
vim.cmd([[hi SpellBad ctermbg=NONE ctermfg=NONE cterm=underline]])
vim.cmd([[hi SpellCap ctermbg=NONE ctermfg=NONE cterm=underline]])
vim.cmd([[hi SpellLocal ctermbg=NONE ctermfg=NONE cterm=underline]])
vim.cmd([[hi spellrare ctermbg=none ctermfg=none cterm=underline]])

-- Highlight the completion popup menu in Neovim
vim.cmd([[highlight CmpItemAbbrDeprecated ctermfg=08]])
vim.cmd([[highlight CmpItemAbbrMatch ctermfg=75]])
vim.cmd([[highlight CmpItemAbbrMatchFuzzy ctermfg=75]])
vim.cmd([[highlight CmpItemKindVariable ctermfg=117]])
vim.cmd([[highlight CmpItemKindInterface ctermfg=117]])
vim.cmd([[highlight CmpItemKindText ctermfg=117]])
vim.cmd([[highlight CmpItemKindFunction ctermfg=176]])
vim.cmd([[highlight CmpItemKindMethod ctermfg=176]])
vim.cmd([[highlight CmpItemKindKeyword ctermfg=187]])
vim.cmd([[highlight CmpItemKindProperty ctermfg=187]])
vim.cmd([[highlight CmpItemKindUnit ctermfg=187]])

-- LineNumber Customization
vim.opt.cursorline = true
-- vim.api.nvim_set_hl(0, "LineNr", { fg = "#B66DFF" })  --#B66DFF
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#B66DFF" }) --#fc7608

-- With context indent highlighted by treesitte
vim.opt.list = true
--vim.opt.listchars:append "space:⋅"
--vim.opt.listchars:append "eol:↴"

-- Cursor Blink
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
