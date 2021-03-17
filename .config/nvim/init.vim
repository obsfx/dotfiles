set exrc
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

" neovim + tmux true color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
" set t_Co=256

filetype off

syntax enable
syntax on

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': [
  \ 'javascript',
  \ 'javascriptreact',
  \ 'typescriptreact',
  \ 'typescript',
  \ 'vue',
  \ 'css',
  \ 'scss',
  \ 'json',
  \ 'graphql',
  \ 'markdown',
  \ 'yaml',
  \ 'html'
  \ ] }
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
Plug 'posva/vim-vue'

Plug 'roxma/vim-tmux-clipboard'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-utils/vim-man'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'

Plug 'sjl/badwolf'
Plug 'obsfx/atlas.vim'

call plug#end()

" theme
" colorscheme badwolf
" hi Normal ctermbg=232
" hi LineNr ctermbg=232
" hi SignColumn ctermbg=232
" hi EndOfBuffer ctermbg=232
" hi TabLineFill ctermbg=234 ctermfg=15
" hi TabLine ctermbg=234 ctermfg=15
" hi TabLineSel ctermbg=250 ctermfg=16

let g:atlas_bold = "bold"
colorscheme atlas

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
    \ 'coc-git',
    \ 'coc-vetur',
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
" replace exact all pattern
nnoremap <Leader>re :%s/\<from\>/to/gc
" switch alternate file
nnoremap <Leader>af :b#<CR>
" switch prev buffer
nnoremap <Leader>bb :bp<CR>
" switch next buffer
nnoremap <Leader>bn :bn<CR>
" left right for command mode
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
" disable lowercase in visual mode
vnoremap u <NOP>
" coc.nvim
" Symbol renaming.
nmap <Leader>rn <Plug>(coc-rename)
" GoTo code navigation
nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <Leader>gy <Plug>(coc-type-definition)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)

" trigger auto completion
inoremap <silent><expr> <C-c> coc#refresh()

function! ShowDocOrDiagnostic()
  if coc#status() != ''
    call CocAction('doHover')
  endif
endfunction

" show if doc or diagnostic exist
nnoremap <silent> <Leader>k :call ShowDocOrDiagnostic()<CR>

" remove trailing whitespaces on save
function! RemoveTrailingWhitespaces()
  let saved_cursor_pos = getpos(".")
  %s/\s\+$//e
  call setpos(".", saved_cursor_pos)
endfunction

augroup rm_trailing_ws
  autocmd!
  autocmd BufWritePre * call RemoveTrailingWhitespaces()
augroup end

augroup cls_on_complete_done
  autocmd!
  autocmd CompleteDone * pclose
augroup end

augroup resize_equally
  autocmd!
  autocmd VimResized * wincmd =
augroup end

" Use ripgrep for searching
" https://github.com/junegunn/fzf.vim/blob/master/doc/fzf-vim.txt#L355
function! RipgrepFzf(query, fullscreen)
  let command_args = [
        \ '--column',
        \ '--line-number',
        \ '--no-heading',
        \ '--color=always',
        \ '-g="!*-lock.json"',
        \ '--type-not sql',
        \ '--smart-case',
        \ ]
  let command_fmt = 'rg ' . join(command_args, ' ') . ' -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
nnoremap <Leader>/ :RG<Space>

" status line
" resources
"   https://shapeshed.com/vim-statuslines/
"   https://gist.github.com/meskarune/57b613907ebd1df67eb7bdb83c6e6641
"   http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
"   https://github.com/fatih/dotfiles/blob/master/vimrc
"   https://learnvimscriptthehardway.stevelosh.com/chapters/17.html

" created using lightline source code
"   https://github.com/itchyny/lightline.vim

" let bg          = 250
" let fg          = 16
" let inactive_bg = 234
" let inactive_fg = 15
"
" exe(printf('hi StatusLine ctermbg=%d ctermfg=%d cterm=NONE', bg, fg))
" exe(printf('hi StatusLineNC ctermbg=%d ctermfg=%d cterm=NONE', inactive_bg, inactive_fg))

hi GitHead guifg=#eeeeee guibg=#282828
hi GitHeadInactive guifg=#444444 guibg=#1c1b1a
hi CocStatusError guifg=#f43753 guibg=#222222 gui=BOLD
hi CocStatusErrorInactive guifg=#444444 guibg=#1c1b1a gui=BOLD
hi CocStatusWarning guifg=#ffc24b guibg=#222222 gui=BOLD
hi CocStatusWarningInactive guifg=#444444 guibg=#1c1b1a gui=BOLD
hi CocStatusInfo guifg=#ffd178 guibg=#222222 gui=BOLD
hi CocStatusInfoInactive guifg=#444444 guibg=#1c1b1a gui=BOLD

function! CocStatus() abort
  let status = get(g:, 'coc_status', '')
  if empty(status) | return '' | endif
  return ' ' . status
endfunction

" Coc.nvim status builder
function! CocStatusField(key, sym) abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  if get(info, a:key, 0) | return '  ' . info[a:key] . a:sym | endif
  return ''
endfunction

function! Modified()
  return &modified ? '●' : '○'
endfunction

function! BuildColoredSection(hlgroup, output)
  return '%#' . a:hlgroup . '#' . '%{' . a:output . '}%*'
endfunction

function! GitHead()
  let h = FugitiveHead()
  if h != '' | return '  ' . h . ' ' | endif
  return ''
endfunction

function! BuildStatusline(inactive)
  let inactivesuffix = a:inactive == 1 ? 'Inactive' : ''

  let cocerror = 'CocStatusError' . inactivesuffix
  let cocwarning = 'CocStatusWarning' . inactivesuffix
  let cocinfo = 'CocStatusInfo' . inactivesuffix
  let githead = 'GitHead' . inactivesuffix

  let line = '%{CocStatus()}'
  let line .= BuildColoredSection(cocerror, "CocStatusField('error', 'X')")
  let line .= BuildColoredSection(cocwarning, "CocStatusField('warning', '!')")
  let line .= BuildColoredSection(cocinfo, "CocStatusField('information', '?')")
  let line .= ' %{Modified()}  %f'
  let line .= '%='
  let line .= '  %{&ff} [%{strlen(&fenc)?&fenc:&enc}] ~ %l:%c %p%% '
  let line .= BuildColoredSection(githead, "GitHead()")
  let line .='%<'

  return line
endfunction

function! UpdateStatusline()
  let currentw = winnr()

  for n in range(1, winnr('$'))
    call setwinvar(n, '&statusline', BuildStatusline(currentw != n))
  endfor
endfunction

augroup statusline
  autocmd!
  autocmd WinEnter,BufEnter,BufDelete,SessionLoadPost,FileChangedShellPost * call UpdateStatusline()
augroup end

" vim file explorer
" remove banner
let g:netrw_banner = 0
" disable file delete with D & capslocked hjkl
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
