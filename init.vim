" Plug related config

call plug#begin()

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ALterantive to FzF
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

" Themes :3
Plug 'morhetz/gruvbox'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'srcery-colors/srcery-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'jacoborus/tender.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
Plug 'nikolvs/vim-sunbather'
Plug 'mildewchan/takodachi.vim' 

Plug 'famiu/nvim-reload'

" Tree/directory explorer
" Plug 'preservim/nerdtree' 
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

" Tags in the current file
" Plug 'preservim/tagbar'

" Autopairs
Plug 'jiangmiao/auto-pairs'

" Coc
" For the moment I will try to configure native Neovim LSP
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'josa42/coc-go', {'do': 'yarn install --frozen-lockfile', 'branch': 'master'}

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Track coding time
Plug 'wakatime/vim-wakatime'

" Markdown live preview via browser
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Editorconfig auto detect
" Plug 'editorconfig/editorconfig-vim'

" Comment stuff
Plug 'tpope/vim-commentary' 

" Distraction free editing
Plug 'junegunn/goyo.vim'

" Auto configure indentation
Plug 'tpope/vim-sleuth'

" LaTeX
Plug 'lervag/vimtex'

" Multicursor
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Notes related
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-notes'

" Debugging
Plug 'puremourning/vimspector'

" Neovim built in LSP
Plug 'neovim/nvim-lspconfig'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'} 
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}

" Custom language related plugins
Plug 'tjdevries/nlua.nvim'          " Lua development
Plug 'nvim-lua/lsp-status.nvim'     " Lua statusline
Plug 'euclidianAce/BetterLua.vim'   " Better lua
" Plug 'nvim-lua/completion-nvim'     " Better LSP completition

Plug 'ziglang/zig.vim'              " Zig language support

" Go lang
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" C lang based formatting
" By default it uses the Google style, if not .clang-format
" file was given
Plug 'rhysd/vim-clang-format'

" Language check
Plug 'dpelle/vim-LanguageTool'

" Because why not
Plug 'ThePrimeagen/vim-apm'

" Wiki :3
Plug 'vimwiki/vimwiki'

" SageMath
Plug 'petRUShka/vim-sage'

" Js
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'eslint/eslint'

" Python
Plug 'fisadev/vim-isort'
" Plug 'HallerPatrick/py_lsp.nvim'

" Dataform
Plug 'andres-lowrie/vim-sqlx'

" Elixir
Plug 'elixir-lang/vim-elixir'

" Prisma
Plug 'pantharshit00/vim-prisma'

" SQLx
Plug 'andres-lowrie/vim-sqlx'

" Code reviews
Plug 'pwntester/octo.nvim'

" Misc
Plug 'kyazdani42/nvim-web-devicons'

" Go to Github line
Plug 'ruanyl/vim-gh-line'

" Lisp
Plug 'vlime/vlime', {'rtp': 'vim/'}
Plug 'bhurlow/vim-parinfer'

" Lsp diagnostics
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

" Copilot
Plug 'github/copilot.vim'

" Testillos
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

call plug#end()

" LSP related
lua require('init')

setlocal omnifunc=v:lua.vim.lsp.omnifunc

nnoremap <silent> gd            <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD            <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gdd           <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> K             <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <c-k>         <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD           <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr            <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR            <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> g0            <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW            <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <Leader>[     <cmd>lua vim.lsp.strutures.Diagnostics.buf_move_next_diagnostic()<CR>
nnoremap <silent> <Leader>]     <cmd>lua vim.lsp.strutures.Diagnostics.buf_move_prev_diagnostic()<CR>

augroup NvimLSP
    autocmd!
    " autocmd BufWritePre *.py,*.rs,*.ex lua vim.lsp.buf.formatting_sync(nil, 2000)
    " autocmd BufWritePre *.py,*.rs,*.ex,*.js,*.ts lua vim.lsp.buf.formatting_sync(nil, 2000)
    " autocmd BufEnter,BufWritePost *.rs lua require('lsp_extensions.inlay_hints').request { aligned = true, prefix = " » " }
augroup END

" Custom LSP diagnostics signs
" sign define LspDiagnosticsErrorSign text=E linehl=ErrorMsg texthl=LspDiagnosticsError numhl=
" sign define LspDiagnosticsWarningSign text=W linehl=MoreMsg texthl=LspDiagnosticsWarningSign numhl=

" Golang related
" Autoformat
autocmd BufWritePre *.go lua goimports(2000)
" Jump to Test files
autocmd FileType go nnoremap <silent> gts <cmd>lua go_switch()<CR>

" Ziglang related
" Autoformatting
let g:zig_fmt_autosave = 1

" C/C++ related
" Enable Clang auto fromatting on C based languages
autocmd FileType c,cpp,objc ClangFormatAutoEnable

" Javascript formatting
" autocmd BufWritePre *.js :normal mpgg=G`p


" General configuration
" ---------------------

" Map Leader to Space
let mapleader=" "

set nocompatible
syntax on

set t_Co=256

if (has("termguicolors"))
    set termguicolors
endif

" Theme :3
set background=dark
colorscheme tender
let g:airline_theme = 'tender'

" set background=dark
" colorscheme nord
" let g:airline_theme = 'nord'

" set background=light
" colorscheme sunbather
" let g:airline_theme = 'sunbather'

" colorscheme srcery
" colorscheme vim-monokai-tasty

" Onehalf
" set background=light
" colorscheme onehalflight

" set background=dark
" colorscheme gruvbox
" let g:airline_theme = 'gruvbox'

" set background=dark
" colorscheme onehalfdark
" let g:airline_theme = 'onehalfdark'

" Solarized config
" set background=light
" let g:solarized_termtrans = 1
" let g:solarized_termcolors = 256
" colorscheme solarized

" Disable startup message
set shortmess+=I

" Number configurations
set relativenumber
set number	

" Line break config
set textwidth=0

" Status line config
set laststatus=2

" Search config
set showmatch	
set hlsearch	
set smartcase	
set ignorecase	
set incsearch	

set cursorline
set ruler	
set undolevels=1000
set backspace=indent,eol,start
set noerrorbells visualbell t_vb=
set belloff=all

" mouse support
set mouse+=a

set noshowmode

set cmdheight=1
set showmatch
set hidden

set completeopt-=preview

set noequalalways
set splitright
set splitbelow
set updatetime=1000

set hlsearch

" Make it so there are always ten lines below my cursor
set scrolloff=10

" Tabs
" Want auto indents automatically
set autoindent
set cindent
set wrap

" Set the width of the tab to 4 wide
" This gets overridden by vim-sleuth, so that's nice
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Make it so that long lines wrap smartly
set breakindent
let &showbreak=repeat(' ', 3)
set linebreak

" Always use spaces instead of tab characters
set expandtab

" Folding
set foldmethod=marker
set foldlevel=0
set modelines=1

" Set the gutter padding
" so it doesnt blink when errors
" or git gutters
set signcolumn=yes

" Clipboard
" Always have the clipboard be the same as my regular clipboard
" set clipboard+=unnamedplus

set inccommand=split
set list

syntax enable

set noswapfile

" Help remap
nnoremap <F1> <esc>
inoremap <F1> <esc>
vnoremap <F1> <esc>

" 0 should be ^
nnoremap 0 ^

" Move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Disable the search highlig.
nnoremap <esc> :noh<return><esc>

" NERD Tree
" map <Leader>a :NERDTreeFind<CR>
" nmap <Leader>t :TagbarToggle<CR>

" Nvim Tree
map <Leader>a :NvimTreeFindFile<CR>

" Terminal
nnoremap <leader>vt :vsplit term://zsh<cr>
tnoremap <esc> <C-\><C-n>

lua require("toggleterm").setup()

" set
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent><c-g> <Cmd>lua _gitui_toggle()<CR>

" Fuzzy related
" map <Leader>o :GFiles<CR>
" map <Leader>O :tabnew<CR>:GFiles<CR>
" map <Leader>p :Files<CR>
" map <Leader>rg :Rg<SPACE>

lua require('telescope').load_extension('fzf')

nnoremap <leader>o <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>O :tabnew<cr><cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>rg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Copy/Paste remaps
" Do not work under WSL
if has("win32")
    noremap <A-c> "*y
    noremap <A-v> "*p
endif

" Splits config

" Remap changing split to Alt+hjkl
noremap <A-l> <C-w>l
noremap <A-h> <C-w>h
noremap <A-j> <C-w>j
noremap <A-k> <C-w>k

" Remap changing tab to Ctrl+n(ext)/p(revious)
noremap <C-n> gt
noremap <C-p> gT

" Vimtex
let g:tex_flavor = 'latex'
let g:vimtex_mappings_enabled = 0

" LaTeX bindings
nnoremap <Leader>vc :VimtexCompile<CR>
nnoremap <Leader>vi :VimtexTocToggle<CR>
nnoremap <Leader>vp :VimtexView<CR> 

" Github link jump
let g:gh_line_map = '<leader>gh'
let g:gh_line_blame_map = '<leader>gb'

" Markdown preview related
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_browser = 'brave'
let g:mkdp_echo_preview_url = 1

if empty(v:servername) && exists('*remote_startserver')
    call remote_startserver('VIM')
endif

" Completion plugin config
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <c-p> completion#trigger_completion()

set completeopt=menuone,noinsert,noselect " Set completeopt to have a better completion experience
set shortmess+=c " Avoid showing message extra message when using completion

" GUI options
" set guifont=MesloLGLDZ_Nerd_Font_Mono:h15
set guifont=Consolas:h16

" Lisp Vlime config
let g:vlime_enable_autodoc = v:true
let g:vlime_window_settings = {'sldb': {'pos': 'belowright', 'vertical': v:true}, 'inspector': {'pos': 'belowright', 'vertical': v:true}, 'preview': {'pos': 'belowright', 'size': v:null, 'vertical': v:true}}

" Lsp Disagnostics
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
" nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" Copilot
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
imap <C-=> <Plug>(copilot-next)
imap <C--> <Plug>(copilot-previous)
imap <C-\> <Plug>(copilot-suggest)

let g:copilot_no_tab_map = v:true

highlight CopilotSuggestion guifg=#555555 ctermfg=8
