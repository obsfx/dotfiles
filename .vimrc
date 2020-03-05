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
Plug 'othree/yajs.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'xavierd/clang_complete'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

call plug#end()

syntax enable

if (has("termguicolors"))
    set termguicolors
endif

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

let g:deoplete#enable_at_startup = 1

let g:clang_library_path='/usr/lib/llvm-9/lib/libclang-9.so.1'

set nocompatible
filetype off

filetype plugin on
set omnifunc=syntaxcomplete#Complete

set tabstop=4
set shiftwidth=4
set expandtab
set number
set numberwidth=4

colo lucid 
syntax on
