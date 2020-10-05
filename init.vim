"   shift + v + < or > mutliline back tab / insert tab
"   w, b and e moving around words
"   yy yank a line (copy)
"   p paste that one line below
"   dd delete line
"   u undo
"   ctrl r redo
"   gd go to local definition
"   e move to end of last char of cursor
"   rp paste over over again
"   /something search
"   ctrl f / b scroll down up
"   a append text right to cursor
"   A add text end of line
"   shfit + i / a move begining / ending of line 
"   ctrl + p / n / y move and select in popup windows without arrow keys
"   vertical split ctrl+w v
"   horizontal split ctrl+w s
"   ctrl+w +   ctrl+w - resize the height of current window
"   ctrl+w >   ctrl+w < resize the width of current window
"   To resize all windows to equal dimensions based on their splits, you can use Ctrl-w =.
"   n and N move around the search results

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
set cmdheight=2
set background=dark
set undodir=~/.vim/undodir
set undofile
set cursorline
set noshowmode

" neovim + tmux true color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

filetype off

syntax enable
syntax on

autocmd CompleteDone * pclose

call plug#begin()

Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'kien/ctrlp.vim'
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'habamax/vim-godot'

"themes, visual customizations
Plug 'itchyny/lightline.vim'
Plug 'huyvohcmc/atlas.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main'  }
Plug 'sjl/badwolf'
Plug 'bluz71/vim-moonfly-colors'
Plug 'ajh17/Spacegray.vim'
Plug 'arzg/vim-substrata'
Plug 'co1ncidence/mountaineer.vim'
Plug 'tek256/simple-dark'
Plug 'eemed/sitruuna.vim'
Plug 'dylanaraps/crayon'
Plug 'vimoxide/vim-cinnabar'
Plug 'co1ncidence/gunmetal.vim'

call plug#end()

"let g:jellybeans_use_gui_italics = 0
"colorscheme jellybeans

"colorscheme srcery

"let g:lightline = { 'colorscheme': 'material_vim'  }
"let g:material_theme_style = 'ocean'
"colorscheme material

"let g:lightline = { 'colorscheme': 'neodark'  }
"let g:neodark#background = '#202020'
"colorscheme neodark

let g:lightline = { 'colorscheme': 'atlas'  }
colorscheme mountaineer

let g:indentLine_leadingSpaceEnabled = 1 
let g:indentLine_leadingSpaceChar = '.'
let g:indentLine_char = '│'

" write tag + ctrl + z + ,
let g:user_emmet_leader_key='<C-Z>'

let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-tsserver',
    \ 'coc-clangd',
    \ 'coc-highlight',
    \ 'coc-python',
    \ 'coc-git'
    \ ]

let g:ctrlp_map = '<c-s>'
" https://github.com/kien/ctrlp.vim/issues/174#issuecomment-49747252
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"no more arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

"disable suspend
nnoremap  <c-z> <nop>

"disable ctrl u in insert mode
inoremap  <c-u> <nop>

" ctrl + e jump end of the line
nmap <C-e> $
" ctrl + a jump begining of the line
nmap <C-a> 0
" ctrl + x :Explore
nmap <C-x> :Explore<CR>
