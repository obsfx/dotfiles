set guicursor=

set nowrap
set sidescroll=1
set hidden
set nobackup
set noswapfile
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set tabstop=4
set shiftwidth=4
set expandtab
set number
set numberwidth=4
set encoding=UTF-8
set nocompatible
set t_Co=256
set cmdheight=2
set background=dark
set undodir=~/.vim/undodir
set undofile

filetype off

syntax enable
syntax on

if (has("termguicolors"))
    set termguicolors
endif

autocmd CompleteDone * pclose

call plug#begin()

Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'lifepillar/vim-gruvbox8'
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'

call plug#end()

let g:gruvbox_italics = 0

"colorscheme tender
colorscheme gruvbox8_hard

