if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set hidden
set nobackup
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

filetype off

syntax enable
syntax on

if (has("termguicolors"))
    set termguicolors
endif

autocmd CompleteDone * pclose

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'

Plug 'jacoborus/tender.vim'

call plug#end()

colorscheme tender

let g:NERDTreeShowHidden=1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1
