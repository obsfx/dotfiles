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
cmd([[set list listchars=tab:>\ ,trail:·,eol:¬,space:⋅,nbsp:·]])
-- Set cursor to beam in insert mode
cmd([[
  highlight Cursor guifg=white guibg=black
  highlight iCursor guifg=white guibg=steelblue
  set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
]])

-- neovim + tmux true color
--cmd([[let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"]])
--cmd([[let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"]])
cmd([[let $NVIM_TUI_ENABLE_TRUE_COLOR=1]])
cmd([[
  if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
]])
set.termguicolors = true
-- set.t_Co            = 256

cmd([[filetype off]])

cmd([[syntax enable]])
cmd([[syntax on]])

--vim.opt.termguicolors = true
--vim.cmd.colorscheme 'melange'

--vim.g.adwaita_darker = true -- for darker version
--vim.g.adwaita_disable_cursorline = true -- to disable cursorline
--vim.cmd([[colorscheme adwaita]])

--cmd([[colorscheme gruvbox8_hard]])
-- cmd([[colorscheme kanagawa]])
--g.material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
--g.material_theme_style = 'darker'
--cmd([[colorscheme material]])
--g.material_style = 'deep ocean'
--cmd([[colorscheme material]])

--g.indentLine_leadingSpaceEnabled = 1
--g.indentLine_leadingSpaceChar = '·'
--g.indentLine_char = '│'

g.gruvbox_contrast_dark = 'hard'
vim.cmd([[colorscheme gruvbox]])

--vim.cmd([[colorscheme oxocarbon]])

--vim.cmd([[colorscheme nordic]])

--vim.cmd([[colorscheme xcodedarkhc]])
--vim.cmd([[colorscheme duskfox]])

require("indent_blankline").setup {
  -- for example, context is off by default, use this to turn it on
  show_current_context = false,
  show_current_context_start = false,
  show_end_of_line = true,
}

-- write tag + ctrl + z + ,
g.user_emmet_leader_key = '<C-z>'

-- snippets
g.UltiSnipsExpandTrigger = "<C-s>"

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
  --'coc-lua',
  'coc-sumneko-lua',
  '@yaegassy/coc-tailwindcss3',
  'coc-svelte',
}
-- prettier
--g["prettier#autoformat_config_present"] = 1
--g["prettier#autoformat_require_pragma"] = 0
--g["prettier#quickfix_enabled"]  = 0
--g["prettier#exec_cmd_async"] = 1

-- vim vue prevent slowing down
g.vue_pre_processors = { 'scss' }

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

-- nvim colorizer init
require 'colorizer'.setup()

g.Netrw_UserMaps = {
  { 'D', 'Netrw_NOP' },
  { 'H', 'Netrw_NOP' },
  { 'J', 'Netrw_NOP' },
  { 'K', 'Netrw_NOP' },
  { 'L', 'Netrw_NOP' },
}
