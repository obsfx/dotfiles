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
  \ 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'graphql', 'markdown', 'yaml', 'html'] }
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
Plug 'peitalin/vim-jsx-typescript'
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
hi StatusLine ctermbg=234 ctermfg=252 cterm=NONE
hi StatusLineNC ctermbg=234 ctermfg=240 cterm=NONE
hi Normal ctermbg=232
hi LineNr ctermbg=232
hi SignColumn ctermbg=232
hi EndOfBuffer ctermbg=232

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

"no more arrow keys
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
" ctrl + e jump end of the line
nnoremap  <C-e> $
vnoremap  <C-e> $h
" ctrl + a jump begining of the line
nnoremap  <C-a> 0
vnoremap  <C-a> 0
" ctrl + s fzf :Files
nnoremap  <C-s> :Files<CR>
" ctrl + x fzf :GFiles
nnoremap  <C-x> :GFiles<CR>
" indentation
nnoremap  <Tab> >>
nnoremap  <BS> <<
vnoremap  <Tab> >gv
vnoremap  <BS> <gv

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
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let branchname = GitBranch()
  return strlen(branchname) > 0?' '.branchname:''
endfunction

hi StatusLineModifiedC    ctermbg=234 ctermfg=157 cterm=bold
hi StatusLineGitInfo      ctermbg=234 ctermfg=244
hi StatusLineGitBranchC   ctermbg=234 ctermfg=87 cterm=bold
hi StatusLineFileTypeC    ctermbg=234 ctermfg=189 cterm=bold

set statusline=
set statusline+=\ %f                            " filepath with maxlen
set statusline+=%#StatusLineModifiedC#          " modified indicator custom color
set statusline+=%{&modified?'*':''}             " modified indicator
set statusline+=%*                              " switch back to statusline highlight

set statusline+=%=                              " switch to right side

set statusline+=%#StatusLineGitInfo#            " custom info section color
set statusline+=%l:%c\ %p%%                     " row:col perc
set statusline+=\ [%{strlen(&fenc)?&fenc:&enc}] " encoding
set statusline+=%*                              " switch back to statusline highlight
set statusline+=%#StatusLineGitBranchC#         " git branch custom color
set statusline+=\%{StatuslineGit()}             " git branch
set statusline+=%*                              " switch back to statusline highlight
set statusline+=\%#StatusLineFileTypeC#         " filetype custom color
set statusline+=\ %{strlen(&ft)?&ft:''}         " filetype
set statusline+=\ %*                            " switch back to statusline highlight
