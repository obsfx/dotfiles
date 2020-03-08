if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'xavierd/clang_complete'
Plug 'Quramy/tsuquyomi'
Plug 'cocopon/iceberg.vim'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
"Plug 'leafgarland/typescript-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'HerringtonDarkholme/yats.vim'

call plug#end()

set encoding=UTF-8
set nocompatible
filetype off

colo lucid
syntax enable
syntax on
set t_Co=256

if (has("termguicolors"))
    set termguicolors
endif

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

let g:deoplete#enable_at_startup = 1

let g:clang_library_path='/usr/lib/llvm-9/lib/libclang-9.so.1'

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

filetype plugin on
set omnifunc=syntaxcomplete#Complete

autocmd CompleteDone * pclose

set tabstop=4
set shiftwidth=4
set expandtab
set number
set numberwidth=4
 

"colorscheme lucid
