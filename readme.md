# Neovim Config

As I spent a lot of time configuring my Neovim environment, I decided to make a particular repo with the nvim config only.

## Constrains

- [Plug](https://github.com/junegunn/vim-plug) as Neovim/Vim plugins manager, trivial to move to another manager I guess.
- [Neovim 0.5.0](https://github.com/neovim/neovim/releases/) at least (for the builtin LSP)
    - You may need to install the LSP binaries. The configured LSPs are in the [lua/lsp_config.lua](./lua/lsp_config.lua)
- You may need to install some binaries like: [ripgrep](https://github.com/BurntSushi/ripgrep), [fzf](https://github.com/junegunn/fzf) and [bat](https://github.com/sharkdp/bat).
- My leader key is *space*.
- Currently I'm not using [coc.nvim](https://github.com/neoclide/coc.nvim), so its related files (`coc.vim` and `coc-settings.json`) are not used. I just leave them here for future convenience.

## Install

Just clone in your Neovim root folder:

- Windows: `~/AppData/Local/nvim`
- Unix: `~/.config/nvim`

### LSP

The keybindings (for all the languages) are the following:

- Go to definition: `gd`
- Go to declaration: `gdd`
- Get implementation: `gD`
- Get references: `gr`
- Rename: `gR`
- Document symbol: `g0`
- Workspace symbol: `gW`
- Move to new diagnostic: `<Leader>dn`
- Move to previous diagnostic: `<Leader>dp`
- Hover info: `K`
- Signature help: `<c-k>`
- Toggle completition: `<c-p>`
- Move in completition menu: `<c-n>` and `<c-p>`

There is auto formatting for C, Python and Rust. Golang too, but not via the LSP, see below.

Rust may have also inlay hints.

#### Go

Lately I work with a lot of Golang so I wanted a fast and easy LSP config + formatting + auto imports. 
I tried to use the vim-go plugin, but after an hour or so it would slow down the client and even freeze sometimes.
As I only wanted the `goimports` on save function I found out [gofmt.vim](https://github.com/tweekmonster/gofmt.vim) which does just that.
You just have to install `goimports`/`gofmt` and it will execute it on save. No freezes nor slows.

For the LSP client I use the builtin Neovim LSP.

#### Python

Check [docs #pyls](https://github.com/neovim/nvim-lspconfig#pyls) to install.

#### VimScript

Check [docs #vimls](https://github.com/neovim/nvim-lspconfig#vimls) to install.

#### Lua

Currently I the LSP binary is hardcoded via a Windows path. This may be changed in the near future.
Check [docs #sumneko_lua](https://github.com/neovim/nvim-lspconfig#sumneko_lua) for more info.

#### Typescript

Check [docs #tsserver](https://github.com/neovim/nvim-lspconfig#tsserver) to install.

#### Rust

Check [docs #rust_analyzer](https://github.com/neovim/nvim-lspconfig#rust_analyzer) to install.

#### Clangd

Check [docs #clangd](https://github.com/neovim/nvim-lspconfig#clangd) to install.

#### Jsonls

Check [docs #jsonls](https://github.com/neovim/nvim-lspconfig#jsonls) to install.

## Non-TUI Clients

- `nvim-qt` is good and it comes pre-installed.
- I found that the [Neovide](https://github.com/Kethku/neovide) frontend is pretty fast, but may be too much because of the default cursor blurring.

## Lua

There could be custom scripts and functions in the `lua/` directory.

