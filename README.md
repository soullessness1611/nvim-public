# SouLLesSNesSZeN's Nvim config (public)
This is my Neovim configuration repository.
(These configs migrated from packer to lazyvim)

## Screenshot
<table width="100%">
  <tr>
  </tr>
  <tr>
    <td width="50%">
      <img src="https://github.com/soullessness1611/nvim-public/blob/main/images/image02.png?raw=true" />
    </td>
    <td width="50%">
      <img src="https://github.com/soullessness1611/nvim-public/blob/main/images/image04.png?raw=true" />
    </td>
  </tr>
  <tr>
  </tr>
  <tr>
    <td width="50%">
      <img src="https://github.com/soullessness1611/nvim-public/blob/main/images/image05.png?raw=true"/>
    </td>
    <td width="50%">
      <img src="https://github.com/soullessness1611/nvim-public/blob/main/images/image06.png?raw=true" />
    </td>
  </tr>
</table>

## Files Structure
![File Structure](./images/image07.png)
## Requirements
- Neovim
- Git
- LazyGit
- LazyVim
- ripgrep
- fd
- fzf
## Terminal and Shell
- iTerm2
- bash
- zsh
- fish
- nu
- Neovide (UI Integrated with Neovim)
## Installations
```zsh
cd ~/.config/
git clone --recursive https://github.com/soullessness1611/nvim-public.git && \
	mv ~/.config/nvim-public ~/.config/nvim

nvim
```
## Components list
- Colorschemes
	- solarized-osaka
- Integrated
	- Neovide
- Plugins
	- ai
		- copilot
		![copilot | 550x325](./images/copilot.png)
	- coding
		- action-preview
		![action-preview | 550x325](./images/code-action-preview.png)
		- code-runner
		![code-runner | 550x325](./images/code-runner.png)
		- codesnap
		![codesnap | 550x325](./images/codesnap.png)
		- colorizer
		![colorizer | 550x325](./images/colorizer.png)
		- colortils
		![colortils | 550x325](./images/colortils.png)
		- document-color
		- null-ls
		- nvim-cmp
		![cmp | 550x325](./images/cmp.png)
		- nvim-treesitter
		![treesitter | 550x325](./images/treesitter.png)
		- quick-code-runner
		![quick-code-runner | 550x325](./images/quick-code-runner.png)
		- tailwindcss-solorizer-cmp
		- TreeSJ
	- Debug
		- nvim-dap-ui
		- nvim-dap-virtual-text
	- Editor
		- autopairs
		- comment
		- format-on-save
		- git-conflict
		- hop
		![hop1 | 550x325](./images/hop1.png)
		- incRename
		![incRename |550x325](./images/incRename.png)
		- moveline
		- nvim-surround
		- reactive
		- telescope
		![telescope | 550x325](./images/telescope.png)
		- todo-comment
		![todo-comment | 550x325](./images/todo-comment.png)
		- ufo.lua
		![ufo | 550x325](./images/ufo.png)
	- LSP
		- lsp-config
		- mason
		- lspsaga
	- UI
		- barbecue
		- bufferline
		- hlchunk
		- incline
		- indent-blankline
		- lualine
		- neo-tree
		- noice
		- nvim-tree
		- outline
		- which-key
		- zen
		- twilight
	- Utilities
		- bracey
		- cellular-automaton
		- diffview
		- git
		- goto-preview
		- live-server
		- markdown-preview
		- ssr
		- searchbox
		- wakatime