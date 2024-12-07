# SouLLesSNesSZeN's Neovim configurations
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
* [git](https://git-scm.com/) ≥ 2.29.0 (`brew install git`)
* [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) ≥ v0.10.0 (`brew install neovim`)

**Optional**:
* [bat](https://github.com/sharkdp/bat) (`brew install bat`)
* [fd](https://github.com/sharkdp/fd) (`brew install fd`)
* [fzf](https://github.com/junegunn/fzf) (`brew install fzf`)
* [ripgrep](https://github.com/BurntSushi/ripgrep) (`brew install ripgrep`)
* [zoxide](https://github.com/ajeetdsouza/zoxide) (`brew install zoxide`)
* [lazygit](https://github.com/jesseduffield/lazygit) (brew install lazygit)
## Terminal and Shell
- [iTerm2](https://iterm2.com/) + [Tmux](https://github.com/tmux/tmux)
![iTerm2_Tmux | 550x325](./images/iTerm2_Tmux.png)
- [zsh](https://github.com/ohmyzsh/ohmyzsh)
![zsh | 550x320](./images/zsh.png)
- fish
![fish | 550x325](./images/fish.png)
- [nu](https://www.nushell.sh/)
![nu | 550x325](./images/nu.png)
## Installations
```zsh
mkdir ~/.config/ && cd ~/.config
git clone --recursive https://github.com/soullessness1611/nvim-public.git && \
	mv ~/.config/nvim-public ~/.config/nvim

nvim
```
## Components list
- Colorschemes
	- [solarized-osaka](https://github.com/craftzdog/solarized-osaka.nvim)
- Integrated
	- [Neovide](https://github.com/neovide/neovide) (UI integration with Neovim)
	![neovide | 550x325](./images/neovide.png)
- Plugins
	- ai
		- [copilot](https://github.com/zbirenbaum/copilot.lua)
		![copilot | 550x325](./images/copilot.png)
	- coding
		- [action-preview](https://github.com/aznhe21/actions-preview.nvim)
		![action-preview | 550x325](./images/code-action-preview.png)
		- code-runner
		![code-runner | 550x325](./images/code-runner.png)
		- [codesnap](https://github.com/mistricky/codesnap.nvim)
		![codesnap | 550x325](./images/codesnap.png)
		- [colorizer](https://neovimcraft.com/plugin/NvChad/nvim-colorizer.lua/)
		![colorizer | 550x325](./images/colorizer.png)
		- [colortils](https://github.com/max397574/colortils.nvim)
		![colortils | 550x325](./images/colortils.png)
		- [document-color](https://github.com/mrshmllow/document-color.nvim)
		- [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)
		- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
		![cmp | 550x325](./images/cmp.png)
		- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
		![treesitter | 550x325](./images/treesitter.png)
		- [quick-code-runner](https://github.com/jellydn/quick-code-runner.nvim)
		![quick-code-runner | 550x325](./images/quick-code-runner.png)
		- [tailwindcss-solorizer-cmp](https://github.com/roobert/tailwindcss-colorizer-cmp.nvim)
		- [TreeSJ](https://github.com/Wansmer/treesj)
		![treesj | 550x325](./images/treesj.png)
	- Debug
		- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
		- [nvim-dap-virtual-text](https://github.com/rcarriga/nvim-dap-virtual-text)
	- Editor
		- [autopairs](https://github.com/windwp/nvim-autopairs)
		- [comment](https://github.com/numToStr/Comment.nvim)
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
		![todo-comment](./images/todo-comment.png)
		- ufo.lua
		![ufo | 550x325](./images/ufo.png)
	- LSP
		- lspconfig
		- mason
		![mason | 550x325](./images/mason.png)
		- lspsaga
		![lspsaga_hoverdoc | 550x325](./images/lspsaga_hover_doc.png)
	- UI
		- barbecue
		![barbecue | 550x325](./images/barbecue.png)
		- bufferline
		![bufferline | 550x325](./images/bufferline.png)
		- hlchunk + indent_blankline
		![hlchunk_indentBlankline | 550x325](./images/hlchunk.png)
		- incline
		![incline | 550x325](./images/incline.png)
		- lualine
		![lualine | 550x325](./images/lualine.png)
		- neo-tree + nvim-tree
		![neo-tree | 550x325](./images/neo-tree.png)
		- noice
		![noice | 550x325](./images/noice.png)
		- outline
		![outline | 550x325](./images/outline.png)
		- which-key
		![which-key | 550x325](./images/which-key.png)
		- zen + twilight
		![zen_twilight | 550x325](./images/zen-twilight.png)
	- Utilities
		- bracey
		- cellular-automaton
		![cellular-automaton | 550x325](./images/cellular-automaton.png)
		- diffview
		![diffview | 550x325](./images/diffview.png)
		- gitsign
		![gitsign | 550x325](./images/gitsign.png)
		- lazygit
		![lazygit | 550x325](./images/lazygit.png)
		- goto-preview
		- live-server
		- markdown-preview
		- ssr
		- searchbox + replace
		- wakatime