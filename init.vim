" Plug related config

call plug#begin()

" Status bar
Plug 'bling/vim-airline'

" Fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ALterantive to FzF
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

" I dont know...
" Plug 'dense-analysis/ale'
Plug 'morhetz/gruvbox'

" TRee/directory explorer
Plug 'preservim/nerdtree' 

" Coc
" For the moment I will try to configure native Neovim LSP
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'josa42/coc-go', {'do': 'yarn install --frozen-lockfile', 'branch': 'master'}

" Git
Plug 'tpope/vim-fugitive'

" Misc
Plug 'wakatime/vim-wakatime'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" Plug 'editorconfig/editorconfig-vim'
" Plug 'preservim/nerdcommenter'

" Auto configure indentation
Plug 'tpope/vim-sleuth'

" LaTeX
Plug 'lervag/vimtex'

" Multicursor
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Notes related
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-notes'

" Neovim built in LSP
Plug 'neovim/nvim-lspconfig'

" Custom language related plugins
Plug 'tjdevries/nlua.nvim'          " Lua development
Plug 'nvim-lua/lsp-status.nvim'     " Lua statusline 
Plug 'euclidianAce/BetterLua.vim'   " Better lua

" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tweekmonster/gofmt.vim'

Plug 'nvim-lua/completion-nvim' " Better LSP completition


call plug#end()

let g:has_coc = 0
if g:has_coc
    if has("win32")
        source ~\AppData\Local\nvim\coc.vim
    elseif has("unix")
        source ~/.config/nvim/coc.vim
    endif
endif

" LSP related
lua require('init')

let g:use_nvim_lsp = 1

if g:use_nvim_lsp
    setlocal omnifunc=v:lua.vim.lsp.omnifunc

    nnoremap <silent> gd            <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <silent> gD            <cmd>lua vim.lsp.buf.declaration()<CR>
    nnoremap <silent> K             <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <silent> gdd           <cmd>lua vim.lsp.buf.implementation()<CR>
    nnoremap <silent> <c-k>         <cmd>lua vim.lsp.buf.signature_help()<CR>
    nnoremap <silent> 1gD           <cmd>lua vim.lsp.buf.type_definition()<CR>
    nnoremap <silent> gr            <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap <silent> gR            <cmd>lua vim.lsp.buf.rename()<CR>
    nnoremap <silent> g0            <cmd>lua vim.lsp.buf.document_symbol()<CR>
    nnoremap <silent> gW            <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
    nnoremap <silent> <Leader>dn    <cmd>lua vim.lsp.strutures.Diagnostics.buf_move_next_diagnostic()<CR>
    nnoremap <silent> <Leader>dp    <cmd>lua vim.lsp.strutures.Diagnostics.buf_move_prev_diagnostic()<CR>

    augroup NvimLSP
        autocmd!
        autocmd BufWritePre *.c,*.py,*.rs,*.json lua vim.lsp.buf.formatting_sync(nil, 1000)
        autocmd BufEnter,BufWritePost *.rs :lua require('lsp_extensions.inlay_hints').request { aligned = true, prefix = " » " }
    augroup END
end

" Golang related
let g:gofmt_exe = 'goimports'
let g:gofmt_on_save = 1

" Python related
if has("win32")
    let g:python3_host_prog = 'C:\Users\2pac\scoop\apps\python\current\python.EXE'
endif

" ---------------------
" General configuration
" ---------------------

" Map Leader to Space
let mapleader=" "

set nocompatible
syntax on

set background=dark
colorscheme gruvbox
set t_Co=256

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
map <Leader>a :NERDTreeToggle<CR>

" Fuzzy related
map <Leader>o :GFiles<CR>
map <Leader>O :tabnew<CR>:GFiles<CR>
map <Leader>rg :Rg<SPACE>

" Telescope config
let g:use_telescope = 1
if g:use_telescope
lua <<EOF
    require('telescope').setup{
        defaults = {}
    }
EOF

    map <Leader>o :lua require'telescope.builtin'.git_files{}<CR>
    map <Leader>O :tabnew<CR>:lua require'telescope.builtin'.git_files{}<CR>
    map <Leader>p :lua require'telescope.builtin'.find_files{}<CR>
end

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

" for Windows
if has("win32")
    let g:vimtex_view_general_viewer = 'SumatraPDF'
    let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
    let g:vimtex_view_general_options_latexmk = '-reuse-instance'
endif

let g:vimtex_latexmk_continuous = 1

if empty(v:servername) && exists('*remote_startserver')
    call remote_startserver('VIM')
endif

" LaTeX bindings
nnoremap <Leader>vc :VimtexCompile<CR>
nnoremap <Leader>vi :VimtexTocToggle<CR>
nnoremap <Leader>vp :VimtexView<CR> 

" Completion plugin config
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <c-p> completion#trigger_completion()

set completeopt=menuone,noinsert,noselect " Set completeopt to have a better completion experience
set shortmess+=c " Avoid showing message extra message when using completion

" GUI options
set guifont=MesloLGL\ Nerd\ Font\ Mono:h13
