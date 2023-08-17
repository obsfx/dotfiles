local cmd               = vim.cmd
local fn                = vim.fn
local execute           = vim.api.nvim_command
local set               = vim.o
local g                 = vim.g
local map               = vim.api.nvim_set_keymap
local telescope_actions = require("telescope.actions")

-- #plugins
-- Auto install packer.nvim if not exists
local install_path      = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

cmd([[packadd packer.nvim]])
-- Auto compile when there are changes in plugins.lua
cmd([[autocmd BufWritePost plugins.lua PackerCompile]])

require("packer").startup(function()
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- core stuff
  use { "neoclide/coc.nvim", branch = "release" }
  use "tpope/vim-fugitive"
  use "github/copilot.vim"
  use "lukas-reineke/indent-blankline.nvim"
  use { "ericpruitt/tmux.vim", rtp = "vim/" }
  use "roxma/vim-tmux-clipboard"
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'fannheyward/telescope-coc.nvim'

  -- different programming languages stuff
  use "amadeus/vim-xml"
  use "mattn/emmet-vim"
  use "OmniSharp/omnisharp-vim"
  use "habamax/vim-godot"
  use { "vlime/vlime", rtp = "vim/" }
  use 'fatih/vim-go'

  -- utility stuff
  use "jiangmiao/auto-pairs"
  use "vim-utils/vim-man"
  use "tpope/vim-surround"
  use "SirVer/ultisnips"
  use 'norcalli/nvim-colorizer.lua'

  -- colorschemes
  use 'rebelot/kanagawa.nvim'
  use 'gruvbox-community/gruvbox'
  use 'loctvl842/monokai-pro.nvim'
  use {
    'kaicataldo/material.vim',
    branch = "main"
  }

  -- font icons
  use 'kyazdani42/nvim-web-devicons'
end)

-- #settings
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

g.material_theme_style = 'ocean'
cmd([[colorscheme material]])

--g.gruvbox_contrast_dark = 'hard'
--cmd([[colorscheme gruvbox]])


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

-- vim vue prevent slowing down
g.vue_pre_processors = { 'scss' }

-- vim file explorer
-- remove banner
g.netrw_banner = 0
-- tree view
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

-- #mappings
-- remap leader to space
g.mapleader = " "
map("n", "<SPACE>", "<NOP>", { noremap = true })
-- no more arrow keys
map("i", "<Up>", "<NOP>", { noremap = true })
map("i", "<Down>", "<NOP>", { noremap = true })
map("i", "<Left>", "<NOP>", { noremap = true })
map("i", "<Right>", "<NOP>", { noremap = true })
map("n", "<Up>", "<NOP>", { noremap = true })
map("n", "<Down>", "<NOP>", { noremap = true })
map("n", "<Left>", "<NOP>", { noremap = true })
map("n", "<Right>", "<NOP>", { noremap = true })
-- line moving
map("n", "<C-n>", ":m .+1<CR>==", { noremap = true })
map("n", "<C-p>", ":m .-2<CR>==", { noremap = true })
map("v", "<C-n>", ":m '>+1<CR>gv=gv", { noremap = true })
map("v", "<C-p>", ":m '<-2<CR>gv=gv", { noremap = true })
-- disable suspend
map("n", "<C-z>", "<NOP>", { noremap = true })
-- disable ctrl u in insert mode
map("i", "<C-u>", "<NOP>", { noremap = true })
-- Remap H and L (top, bottom of screen to left and right end of line)
-- Disabled to keep base vim experience
--map("n",  "H",        "^", {noremap = true})
--map("n",  "L",        "$", {noremap = true})
--map("v",  "H",        "^", {noremap = true})
--map("v",  "L",        "g_", {noremap = true})
--map("n",  "KK",       "gg", {noremap = true})
--map("n",  "JJ",       "G", {noremap = true})
--map("v",  "KK",       "gg", {noremap = true})
--map("v",  "JJ",       "G", {noremap = true})
-- jj to exit insert mode
map("i", "jj", "<Esc>", { noremap = true })
-- no more esc
map("i", "<Esc>", "<NOP>", { noremap = true })
-- no more ctrl-c
map("i", "<C-c>", "<NOP>", { noremap = true })

--map("n",  "<Leader>s",":Files<CR>", {noremap = true})
--map("n",  "<Leader>g",":GFiles<CR>", {noremap = true})
map("n", "<Leader>s", "<cmd>Telescope find_files<CR>", { noremap = true })
map("n", "<Leader>g", "<cmd>Telescope live_grep<CR>", { noremap = true })

-- easy save
map("n", "<Leader>w", ":w<cr>", { noremap = true })
-- indentation
map("n", ">", ">>", { noremap = true })
map("n", "<", "<<", { noremap = true })
map("v", ">", ">gv", { noremap = true })
map("v", "<", "<gv", { noremap = true })
-- use system clipboard
map("", "<Leader>y", [["+y]], { noremap = true })
map("", "<Leader>p", [["+p]], { noremap = true })
-- paste last yanked thing
map("n", "P", [["0p]], { noremap = true })
-- replace all pattern
map("n", "<Leader>r", ":%s/from/to/g", { noremap = true })
-- replace exact all pattern
map("n", "<Leader>re", [[:%s/\<from\>/to/gc]], { noremap = true })
-- switch alternate file
map("n", "<Leader>af", ":b#<CR>", { noremap = true })
-- switch prev buffer
map("n", "<Leader>bb", ":bp<CR>", { noremap = true })
-- switch next buffer
map("n", "<Leader>bn", ":bn<CR>", { noremap = true })
-- left right for command mode
map("n", "<Leader>bf", ":Buffers<CR>", { noremap = true })
-- left right for command mode
map("c", "<C-h>", "<Left>", { noremap = true })
map("c", "<C-l>", "<Right>", { noremap = true })
-- disable lowercase in visual mode
map("v", "u", "<NOP>", { noremap = true })
-- coc.nvim
-- Symbol renaming.
map("n", "<Leader>rn", "<Plug>(coc-rename)", {})
-- GoTo code navigation
map("n", "<Leader>cd", "<Plug>(coc-definition)", { silent = true })
map("n", "<Leader>cd", "<Plug>(coc-definition)", { silent = true })
map("n", "<Leader>cy", "<Plug>(coc-type-definition)", { silent = true })
map("n", "<Leader>ci", "<Plug>(coc-implementation)", { silent = true })
map("n", "<Leader>cr", "<Plug>(coc-references)", { silent = true })
map("n", "<Leader>cf", "<Plug>(coc-codeaction)", { silent = true })
-- diagnostics
map("n", "<Leader>ca", ":CocDiagnostics<cr>", { silent = true })
-- fugitive
map("n", "gs", ":Gvdiffsplit<cr>", { silent = true })
map("n", "gl", ":Gclog<cr>", { silent = true })
-- telescope coc
map("n", "<Leader>twd", ":Telescope coc workspace_diagnostics<CR>", { silent = true })
map("n", "<Leader>td", ":Telescope coc diagnostics<CR>", { silent = true })
map("n", "<Leader>tr", ":Telescope coc references<CR>", { silent = true })

-- trigger auto completion
map("i", "<C-c>", "coc#refresh()", { silent = true, expr = true, noremap = true })

function _G.show_doc_or_diagnostic()
  cmd([[call CocAction('doHover')]])
end

-- show if doc or diagnostic exist
map("n", "<Leader>k", ":call v:lua.show_doc_or_diagnostic()<CR>", { silent = true, noremap = true })

-- #lua utility
local merge = function(f, s)
  for k, v in pairs(s) do f[k] = v end
  return f
end

local at = function(str, index)
  return string.sub(str, index, index)
end

local is_table = function(obj)
  return type(obj) == "table"
end

local is_array = function(obj)
  if not is_table(obj) then return false end

  local i = 0
  for _ in pairs(obj) do
    i = i + 1
    if obj[i] == nil then return false end
  end

  return true
end

local is_empty = function(obj)
  return is_array(obj) and #obj == 0
end

local is_nil = function(value)
  return value == nil
end

local function slice_table(obj, start, finish)
  if is_empty(obj) or start == finish then return {} end

  local output = {}
  local _finish = #obj
  local _start = 1

  if start >= 0 then
    _start = start
  elseif is_nil(finish) and start < 0 then
    _start = #obj + start + 1
  end

  if (finish and finish >= 0) then
    _finish = finish - 1
  elseif finish and finish < 0 then
    _finish = #obj + finish
  end

  for i = _start, _finish do table.insert(output, obj[i]) end

  return output
end

local substitute_home = function(path)
  return vim.fn.substitute(path, vim.fn.expand("$HOME"), "~", "")
end

local shrink_path = function(path)
  if at(path, 1) == "." then
    return at(path, 1) .. at(path, 2)
  else
    return at(path, 1)
  end
end

-- #statusline
-- fish like path and utils https://github.com/usirin/init.lua
function _G.fish_like_path()
  local path = substitute_home(vim.fn.expand("%:p"))
  local paths = vim.fn.split(substitute_home(vim.fn.expand("%:p")), "/")
  local level = 1

  if #paths == 0 then
    return "/"
  elseif #paths == 1 then
    if paths[1] == "~" then
      return "~/"
    else
      return path
    end
  end

  local after = slice_table(paths, -(level))
  local before = slice_table(paths, 1, -(level))

  for key, value in pairs(before) do before[key] = shrink_path(value) end

  return vim.fn.join(before, "/") .. "/" .. vim.fn.join(after, "/")
end

cmd([[
  function! CocStatus() abort
    let status = get(g:, 'coc_status', '')
    if empty(status) | return '' | endif
    return ' ' .. status
  endfunction

  " Coc.nvim status builder
  function! CocStatusField(key, sym) abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    if get(info, a:key, 0) | return '  ' .. info[a:key] . a:sym | endif
    return ''
  endfunction
]])

-- get git head
function _G.git_head()
  local h = fn["FugitiveHead"]()
  if h ~= "" then
    return " (" .. h .. ") "
  end
  return ""
end

set.statusline = ""
set.statusline = set.statusline .. "%{v:lua.fish_like_path()}"
set.statusline = set.statusline .. " %m"
set.statusline = set.statusline .. "%="
set.statusline = set.statusline .. "%{CocStatus()}"
set.statusline = set.statusline .. "%{CocStatusField('error','X')}"
set.statusline = set.statusline .. "%{CocStatusField('warning','!')}"
set.statusline = set.statusline .. "%{CocStatusField('information','?')}"
set.statusline = set.statusline .. " %{&fileencoding?&fileencoding:&encoding}"
set.statusline = set.statusline .. " [%{&fileformat}]"
set.statusline = set.statusline .. " %l/%L:%c"
set.statusline = set.statusline .. " %p%%"
set.statusline = set.statusline .. " %{v:lua.git_head()}"
set.statusline = set.statusline .. "%<"

-- #treesitter
require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "javascript",
    "typescript",
    "c",
    "python",
    "css",
    "scss",
    "go",
    "json",
    "commonlisp",
    "lua",
    "tsx",
    "html",
    "graphql",
    "bash",
    "vue",
    "vim",
    "svelte"
  },

  highlight = {
    enable = true,
    --disable = { "go" },
  },
  auto_install = true,
}

-- #augroups
function _G.remove_trailing_ws()
  local saved_cursor_pos = fn.getpos(".")
  cmd([[%s/\s\+$//e]])
  fn.setpos(".", saved_cursor_pos)
end

cmd([[
  augroup rm_trailing_ws
    autocmd!
    autocmd BufWritePre * call v:lua.remove_trailing_ws()
  augroup end

  augroup cls_on_complete_done
    autocmd!
    autocmd CompleteDone * pclose
  augroup end

  augroup resize_equally
    autocmd!
    autocmd VimResized * wincmd =
  augroup end

  autocmd BufWritePre *.py execute ':Black'
]])

-- go
cmd([[au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4]])
cmd([[command! -nargs=0 Prettier :CocCommand prettier.formatFile]])

-- #telescope
require("telescope").setup {
  defaults = {
    --preview = false,
    layout_config = {
      vertical = { width = 1 }
    },
    mappings = {
      i = {
        ["<esc>"] = telescope_actions.close
      },
    },
    file_ignore_patterns = { "./node_modules/*", "node_modules", "^node_modules/*", "node_modules/*" }
  },
  pickers = {
    find_files = {
      disable_devicons = true
    },
    live_grep = {
      disable_devicons = true
    },
  },
}
require('telescope').load_extension('coc')

-- #legacy configuration

-- #quickfixlist
-- -- reference: https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3
-- cmd([[
--   set grepprg=rg\ --vimgrep
--
--   function! Grep(...)
--     return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
--   endfunction
--
--   command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
--   command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)
--
--   cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
--   cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'
--
--   augroup quickfix
--     autocmd!
--     autocmd QuickFixCmdPost cgetexpr cwindow
--     autocmd QuickFixCmdPost lgetexpr lwindow
--   augroup END
-- ]])
--

-- #fzf
-- -- Use ripgrep for searching
-- -- https://github.com/junegunn/fzf.vim/blob/master/doc/fzf-vim.txt#L355
-- function _G.rgfzf(argv, fullscreen)
--   local command_args = {
--     "--column",
--     "--line-number",
--     "--no-heading",
--     "--color=always",
--     "-g=\"!*-lock.json\"",
--     "--type-not sql",
--     "--smart-case",
--   }
--
--   local extra_commands = {}
--   local query = ''
--   local paramlist = fn.split(argv, " ")
--
--   if paramlist[1] == "--type" then
--     extra_commands = utils.slice_table(paramlist, 1, 3)
--     query = fn.join(utils.slice_table(paramlist, 3, #paramlist + 1), " ")
--   else
--     query = fn.join(paramlist, " ")
--   end
--
--   local command_fmt = 'rg ' .. fn.join(utils.merge(command_args, extra_commands), ' ') .. ' -- %s || true'
--   local initial_command = fn.printf(command_fmt, fn.shellescape(query))
--   local reload_command = fn.printf(command_fmt, '{q}')
--   local spec = {options = { '--phony', '--query', query, '--bind', 'change:reload:' .. reload_command }}
--   fn["fzf#vim#grep"](initial_command, 1, fn["fzf#vim#with_preview"](spec), fullscreen)
-- end
--
-- cmd([[command! -nargs=* -bang RG call v:lua.rgfzf(<q-args>, <bang>0)]])
-- cmd([[nnoremap <Leader>/ :RG<Space>]])
