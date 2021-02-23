set guicursor=
set nowrap
set sidescroll=1
set hidden
set nobackup
set noswapfile
set nowritebackup
set updatetime=300
set timeoutlen=500
set shortmess+=c
set tabstop=2
set smarttab
set shiftwidth=2
set expandtab
set number
set numberwidth=2
set encoding=UTF-8
set nocompatible
set cmdheight=2
set background=dark
set undodir=~/.vim/undodir
set undofile
set cursorline
set scrolloff=4
set signcolumn=yes
set autoread
"set noshowmode
"
" neovim + tmux true color
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set termguicolors
"set t_Co=256

filetype off

syntax enable
syntax on

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'javascriptreact', 'typescriptreact', 'typescript', 'css', 'scss', 'json', 'graphql', 'markdown', 'yaml', 'html'] }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'amadeus/vim-xml'
Plug 'ericpruitt/tmux.vim', {'rtp': 'vim/'}
Plug 'cakebaker/scss-syntax.vim'
Plug 'vim-python/python-syntax'
Plug 'tbastos/vim-lua'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'habamax/vim-godot'
Plug 'vlime/vlime', {'rtp': 'vim/'}

Plug 'roxma/vim-tmux-clipboard'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'Yggdroot/indentLine'

Plug 'sjl/badwolf'

call plug#end()

" theme
colorscheme badwolf
hi Normal ctermbg=232
hi LineNr ctermbg=232
hi SignColumn ctermbg=232
hi EndOfBuffer ctermbg=232
hi TabLineFill ctermbg=234 ctermfg=15
hi TabLine ctermbg=234 ctermfg=15
hi TabLineSel ctermbg=250 ctermfg=16

let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '.'
let g:indentLine_char = '│'

" write tag + ctrl + z + ,
let g:user_emmet_leader_key='<C-z>'

let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-tsserver',
    \ 'coc-clangd',
    \ 'coc-highlight',
    \ 'coc-python',
    \ 'coc-git'
    \ ]

" prettier
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#quickfix_enabled  = 0
let g:prettier#exec_cmd_async = 1

" remap leader to space
let mapleader = " "
nnoremap <SPACE> <NOP>
" no more arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
" line moving
nnoremap  <A-k> :m .-2<CR>==
nnoremap  <A-j> :m .+1<CR>==
vnoremap  <A-j> :m '>+1<CR>gv=gv
vnoremap  <A-k> :m '<-2<CR>gv=gv
" disable suspend
nnoremap  <C-z> <NOP>
" disable ctrl u in insert mode
inoremap  <C-u> <NOP>
" Remap H and L (top, bottom of screen to left and right end of line)
"  https://github.com/fatih/dotfiles/blob/master/vimrc
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_
" jj to exit insert mode
inoremap  jj <Esc>
" no more esc
inoremap  <Esc> <NOP>
" no more ctrl-c
inoremap  <C-c> <NOP>
" leader + s fzf :Files
nnoremap  <Leader>s :Files<CR>
" leader + x fzf :GFiles
nnoremap  <Leader>g :GFiles<CR>
" easy save
nnoremap  <Leader>w :w<cr>
" indentation
nnoremap  <Tab> >>
nnoremap  <BS> <<
vnoremap  <Tab> >gv
vnoremap  <BS> <gv
" use system clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p
" paste last yanked thing
noremap P "0p
" replace all pattern
nnoremap <Leader>r :%s/from/to/g
" left right for command mode
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

" remove trailing whitespaces on save
function! RemoveTrailingWhitespaces()
  let saved_cursor_pos = getpos(".")
  %s/\s\+$//e
  call setpos(".", saved_cursor_pos)
endfunction

augroup rm_trailing_ws
  autocmd BufWritePre * call RemoveTrailingWhitespaces()
augroup end

augroup cls_on_complete_done
  autocmd CompleteDone * pclose
augroup end

augroup resize_equally
  autocmd VimResized * wincmd =
augroup end

" Use ripgrep for searching
" Options include:
"   --vimgrep -> Needed to parse the rg response properly for ack.vim
"   --type-not sql -> Avoid huge sql file dumps as it slows down the search
"   -g="!*-lock.json" -> Exclude *-lock.json files
"   --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql -g="!*-lock.json" --smart-case'
" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1
" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1
" Don't jump to first match
cnoreabbrev Ack Ack!
" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>

" status line
" resources
"   https://shapeshed.com/vim-statuslines/
"   https://gist.github.com/meskarune/57b613907ebd1df67eb7bdb83c6e6641
"   http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
"   https://github.com/fatih/dotfiles/blob/master/vimrc
"   https://learnvimscriptthehardway.stevelosh.com/chapters/17.html

let bg          = 250
let fg          = 16
let inactive_bg = 234
let inactive_fg = 15

exe(printf('hi StatusLine ctermbg=%d ctermfg=%d cterm=NONE', bg, fg))
exe(printf('hi StatusLineNC ctermbg=%d ctermfg=%d cterm=NONE', inactive_bg, inactive_fg))

set statusline=
set statusline+=\ %{&modified?'●':'○'}              " modified indicator
set statusline+=\ \ %f                              " filepath
set statusline+=%=                                  " switch to right side
set statusline+=\ %{&ff}                            " file format
set statusline+=\ [%{strlen(&fenc)?&fenc:&enc}]     " encoding
set statusline+=\ ~                                 " separator
set statusline+=\ %l:%c\ %p%%                       " line:col perc
set statusline+=%<\                                 " cut at end

" vim file explorer
" remove banner
let g:netrw_banner = 0
" disable file deleting & capslocked hjkl
function! NetrwD_NOP(islocal) abort
  return ''
endfunction
let g:Netrw_UserMaps = [
  \ ['D', 'NetrwD_NOP'],
  \ ['H', 'NetrwD_NOP'],
  \ ['J', 'NetrwD_NOP'],
  \ ['K', 'NetrwD_NOP'],
  \ ['L', 'NetrwD_NOP'],
  \ ]
