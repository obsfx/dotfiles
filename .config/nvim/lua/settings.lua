local set = vim.o
local cmd = vim.cmd
local g = vim.g

-- local fn  = vim.fn
-- local execute = vim.api.nvim_command

set.exrc = true
set.guicursor = ""
set.wrap = false
set.scroll = 1
set.hidden = true
set.backup = false
set.swapfile = false
set.writebackup = false
set.updatetime = 300
set.timeoutlen = 500
set.shortmess = set.shortmess .. "c"
set.tabstop = 2
set.smarttab = true
set.shiftwidth = 2
set.expandtab = true
set.number = true
set.relativenumber = true
set.numberwidth = 2
set.encoding = "UTF-8"
set.compatible = false
set.cmdheight = 2
set.background = "dark"
set.undofile = true
set.cursorline = true
set.scrolloff = 4
set.signcolumn = "yes"
set.autoread = true
-- set.showmode = false
set.secure = true
set.mouse = "a"
-- Show invisible characters
cmd([[set list listchars=tab:>\ ,trail:·,eol:¬,nbsp:·]])
-- Set cursor to beam in insert mode
cmd([[
  highlight Cursor guifg=white guibg=black
  highlight iCursor guifg=white guibg=steelblue
  set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
]])

-- neovim + tmux true color
cmd([[let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"]])
cmd([[let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"]])
cmd([[let $NVIM_TUI_ENABLE_TRUE_COLOR=1]])
set.termguicolors = true
-- set.t_Co            = 256

cmd([[filetype off]])

cmd([[syntax enable]])
cmd([[syntax on]])

--cmd([[colorscheme gruvbox8_hard]])
cmd([[colorscheme kanagawa]])

g.indentLine_leadingSpaceEnabled = 1
g.indentLine_leadingSpaceChar = '·'
g.indentLine_char = '│'

-- write tag + ctrl + z + ,
g.user_emmet_leader_key = '<C-z>'

-- snippets
g.UltiSnipsExpandTrigger="<C-s>"

g.coc_global_extensions = {
  'coc-css',
  'coc-html',
  'coc-pyright',
  'coc-tsserver',
  'coc-prettier',
  'coc-clangd',
  'coc-highlight',
  'coc-styled-components',
  'coc-snippets',
  'coc-git',
  'coc-vetur',
  'coc-eslint',
  'coc-json',
  'coc-go',
  'coc-conjure',
  'coc-lua',
  'coc-svelte',
}

-- prettier
--g["prettier#autoformat_config_present"] = 1
--g["prettier#autoformat_require_pragma"] = 0
--g["prettier#quickfix_enabled"]  = 0
--g["prettier#exec_cmd_async"] = 1

-- vim vue prevent slowing down
g.vue_pre_processors = {'scss'}

-- vim file explorer
-- remove banner
g.netrw_banner = 0
-- tree view
-- g.netrw_liststyle = 3
-- disable file delete with D & capslocked hjkl
cmd([[
  function! Netrw_NOP(islocal) abort
    return ''
  endfunction
]])

-- emotion css block macro
cmd([[
  let @c="maHf{lvt}yJJkiconst jjpa = css`jjojj'a"
]])

-- nvim colorizer init
require'colorizer'.setup()

g.Netrw_UserMaps = {
  { 'D', 'Netrw_NOP' },
  { 'H', 'Netrw_NOP' },
  { 'J', 'Netrw_NOP' },
  { 'K', 'Netrw_NOP' },
  { 'L', 'Netrw_NOP' },
}
