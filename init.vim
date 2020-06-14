"   shift + v + < or > mutliline back tab / insert tab
"   w and b moving around words
"   yy yank a line (copy)
"   p paste that one line below
"   dd delete line
"   u undo
"   ctrl r redo
"   e move to end of last char of cursor
"   rp paste over over again
"   /something search
"   ctrl f / b scroll down up
"   a append text right to cursor
"   A add text end of line
"   shfit + i / a move begining / ending of line 
"   ctrl + p / n / y move and select in popup windows without arrow keys

set guicursor=
set nowrap
set sidescroll=1
set hidden
set nobackup
set noswapfile
set nowritebackup
set updatetime=300
set shortmess+=c
set tabstop=4
set smarttab
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
Plug 'Yggdroot/indentLine'

Plug 'itchyny/lightline.vim'
Plug 'lifepillar/vim-gruvbox8'
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'

call plug#end()

let g:gruvbox_italics = 0
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

let g:indentLine_leadingSpaceEnabled = 1 
let g:indentLine_leadingSpaceChar = '.'
let g:indentLine_char = '│'

"colorscheme tender
colorscheme gruvbox8_hard

"no more arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
