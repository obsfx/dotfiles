local set           = vim.o
local cmd           = vim.cmd
local fn            = vim.fn
local execute       = vim.api.nvim_command
local g             = vim.g
local map           = vim.api.nvim_set_keymap

set.exrc            = true
set.guicursor       = ""
set.wrap            = false
set.scroll          = 1
set.hidden          = true
set.backup          = false
set.swapfile        = false
set.writebackup     = false
set.updatetime      = 300
set.timeoutlen      = 500
set.shortmess       = set.shortmess .. "c"
set.tabstop         = 2
set.smarttab        = true
set.shiftwidth      = 2
set.expandtab       = true
set.number          = true
set.relativenumber  = true
set.numberwidth     = 2
set.encoding        = "UTF-8"
set.compatible      = false
set.cmdheight       = 2
set.background      = "dark"
set.undofile        = true
set.cursorline      = true
set.scrolloff       = 4
set.signcolumn      = "yes"
set.autoread        = true
-- set.noshowmode      = true
set.secure          = true
-- Show invisible characters
cmd([[set list listchars=tab:➜\ ,trail:·,eol:¬,nbsp:·]])

-- neovim + tmux true color
cmd([[let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"]])
cmd([[let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"]])
cmd([[let $NVIM_TUI_ENABLE_TRUE_COLOR=1]])
set.termguicolors   = true
-- set.t_Co            = 256

cmd([[filetype off]])

cmd([[syntax enable]])
cmd([[syntax on]])

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd([[packadd packer.nvim]])
-- Auto compile when there are changes in plugins.lua
vim.cmd([[autocmd BufWritePost plugins.lua PackerCompile]])

require("packer").startup(function()
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  use {
    "prettier/vim-prettier",
    run = "npm install",
    ft = {
      "javascript",
      "javascriptreact",
      "typescriptreact",
      "typescript",
      "vue",
      "css",
      "scss",
      "json",
      "graphql",
      "markdown",
      "yaml",
      "html"
    }
  }
  use "HerringtonDarkholme/yats.vim"
  use "amadeus/vim-xml"
  use {"ericpruitt/tmux.vim", rtp = "vim/"}
  use "cakebaker/scss-syntax.vim"
  use "vim-python/python-syntax"
  use "tbastos/vim-lua"
  use "pangloss/vim-javascript"
  use "maxmellon/vim-jsx-pretty"
  use "leafgarland/typescript-vim"
  use "mattn/emmet-vim"
  use "OmniSharp/omnisharp-vim"
  use "habamax/vim-godot"
  use {"vlime/vlime", rtp = "vim/"}
  use "posva/vim-vue"
  use "jparise/vim-graphql"

  use "roxma/vim-tmux-clipboard"
  use "tpope/vim-fugitive"
  use "jiangmiao/auto-pairs"
  use "vim-utils/vim-man"
  use  {"junegunn/fzf",
    dir = "~/.fzf",
    run = "./install --all"
  }
  use "junegunn/fzf.vim"
  use "Yggdroot/indentLine"
  use "tpope/vim-surround"
  use {"neoclide/coc.nvim", branch = "release"}

  use {"kaicataldo/material.vim", branch = "main"}
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use "rktjmp/lush.nvim"
end)

g.material_theme_style = 'ocean'
cmd([[colorscheme material]])

-- cmd([[colorscheme bleed-purple]])

g.indentLine_leadingSpaceEnabled = 1
g.indentLine_leadingSpaceChar = '·'
g.indentLine_char = '│'

-- write tag + ctrl + z + ,
g.user_emmet_leader_key = '<C-z>'

g.coc_global_extensions = {
  'coc-css',
  'coc-html',
  'coc-tsserver',
  'coc-clangd',
  'coc-highlight',
  'coc-styled-components',
  'coc-python',
  'coc-git',
  'coc-vetur',
  'coc-eslint',
  'coc-json',
  'coc-go',
}

-- prettier
g["prettier#autoformat_config_present"] = 1
g["prettier#autoformat_require_pragma"] = 0
g["prettier#quickfix_enabled"]  = 0
g["prettier#exec_cmd_async"] = 1

-- vim vue prevent slowing down
g.vue_pre_processors = {'scss'}

-- remap leader to space
g.mapleader = " "
map("n",  "<SPACE>",  "<NOP>", {noremap = true})
-- no more arrow keys
map("i",  "<Up>",     "<NOP>", {noremap = true})
map("i",  "<Down>",   "<NOP>", {noremap = true})
map("i",  "<Left>",   "<NOP>", {noremap = true})
map("i",  "<Right>",  "<NOP>", {noremap = true})
map("n",  "<Up>",     "<NOP>", {noremap = true})
map("n",  "<Down>",   "<NOP>", {noremap = true})
map("n",  "<Left>",   "<NOP>", {noremap = true})
map("n",  "<Right>",  "<NOP>", {noremap = true})
-- line moving
map("n",  "<A-k>",    ":m .-2<CR>==", {noremap = true})
map("n",  "<A-j>",    ":m .+1<CR>==", {noremap = true})
map("v",  "<A-j>",    ":m '>+1<CR>gv=gv", {noremap = true})
map("v",  "<A-k>",    ":m '<-2<CR>gv=gv", {noremap = true})
-- disable suspend
map("n",  "<C-z>",    "<NOP>", {noremap = true})
-- disable ctrl u in insert mode
map("i",  "<C-u>",    "<NOP>", {noremap = true})
-- Remap H and L (top, bottom of screen to left and right end of line)
-- https://github.com/fatih/dotfiles/blob/master/vimrc
map("n",  "H",        "^", {noremap = true})
map("n",  "L",        "$", {noremap = true})
map("v",  "H",        "^", {noremap = true})
map("v",  "L",        "g_", {noremap = true})
map("n",  "KK",       "gg", {noremap = true})
map("n",  "JJ",       "G", {noremap = true})
map("v",  "KK",       "gg", {noremap = true})
map("v",  "JJ",       "G", {noremap = true})
-- jj to exit insert mode
map("i",  "jj",       "<Esc>", {noremap = true})
-- no more esc
map("i",  "<Esc>",    "<NOP>", {noremap = true})
-- no more ctrl-c
map("i",  "<C-c>",    "<NOP>", {noremap = true})

map("n",  "<Leader>s",":Files<CR>", {noremap = true})
map("n",  "<Leader>g",":GFiles<CR>", {noremap = true})

-- easy save
map("n",  "<Leader>w",":w<cr>", {noremap = true})
-- indentation
map("n",  "<Tab>",    ">>", {noremap = true})
map("n",  "<BS>",     "<<", {noremap = true})
map("v",  "<Tab>",    ">gv", {noremap = true})
map("v",  "<BS>",     "<gv", {noremap = true})
-- use system clipboard
map("",  "<Leader>y", [["+y]], {noremap = true})
map("",  "<Leader>p", [["+p]], {noremap = true})
-- paste last yanked thing
map("n",  "P",         [["0p]], {noremap = true})
-- replace all pattern
map("n",  "<Leader>r", ":%s/from/to/g", {noremap = true})
-- replace exact all pattern
map("n",  "<Leader>re",[[:%s/\<from\>/to/gc]], {noremap = true})
-- switch alternate file
map("n",  "<Leader>af", ":b#<CR>", {noremap = true})
-- switch prev buffer
map("n",  "<Leader>bb", ":bp<CR>", {noremap = true})
-- switch next buffer
map("n",  "<Leader>bn", ":bn<CR>", {noremap = true})
-- left right for command mode
map("n",  "<Leader>bf", ":Buffers<CR>", {noremap = true})
-- left right for command mode
map("c",  "<C-h>",      "<Left>", {noremap = true})
map("c",  "<C-l>",      "<Right>", {noremap = true})
-- disable lowercase in visual mode
map("v",  "u",          "<NOP>", {noremap = true})
-- coc.nvim
-- Symbol renaming.
map("n",  "<Leader>rn", "<Plug>(coc-rename)", {})
-- GoTo code navigation
map("n",  "<Leader>cd", "<Plug>(coc-definition)", {silent = true})
map("n",  "<Leader>cy", "<Plug>(coc-type-definition)", {silent = true})
map("n",  "<Leader>ci", "<Plug>(coc-implementation)", {silent = true})
map("n",  "<Leader>cr", "<Plug>(coc-references)", {silent = true})
-- diagnostics
map("n",  "<Leader>ca", ":CocDiagnostics<cr>", {silent = true})

-- trigger auto completion
map("i",  "<C-c>",      "coc#refresh()", {silent = true, expr = true, noremap = true})

function _G.show_doc_or_diagnostic()
  if fn["coc#status"]() ~= '' then
    cmd([[call CocAction('doHover')]])
  end
end

-- show if doc or diagnostic exist
map("n",  "<Leader>k",  "v:lua.show_doc_or_diagnostic()", {silent = true})

-- remove trailing whitespaces on save
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
]])

-- go
cmd([[au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4]])
cmd([[au BufWritePost *.go silent! execute "!gofmt -w %" | e]])

require("nvim-treesitter.configs").setup {
  highlight = {enable = true},

  query_linter = {enable = true, use_virtual_text = true, lint_events = {"BufWrite", "CursorHold"}},
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?"
    }
  }
}

-- fish like path and utils https://github.com/usirin/init.lua
function merge(f, s)
  for k,v in pairs(s) do f[k] = v end
  return f
end

function at(str, index)
  return string.sub(str, index, index)
end

function is_table(obj)
  return type(obj) == "table"
end

function is_array(obj)
  if not is_table(obj) then return false end

  local i = 0
  for _ in pairs(obj) do
    i = i + 1
    if obj[i] == nil then return false end
  end

  return true
end

function is_empty(obj)
  return is_array(obj) and #obj == 0 end

function is_nil(value)
  return value == nil
end

function slice_table(obj, start, finish)
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

function substitute_home(path)
  return vim.fn.substitute(path, vim.fn.expand("$HOME"), "~", "")
end

function shrink_path(path)
  if at(path, 1) == "." then
    return at(path, 1) .. at(path, 2)
  else
    return at(path, 1)
  end
end

function _G.fish_like_path()
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

vim.cmd([[
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
]])

-- Coc.nvim status builder
function _G.coc_status()
  local status = fn.get(vim.go, "coc_status", '')
  if fn.empty(status) then
    return ""
  end
  return " " ..status
end

function _G.coc_status_field(key, sym)
  local info = fn.get(vim.bo, "coc_diagnostic_info", {})
  --print(info, "--info", info[key])
  if fn.empty(info) then
    return ""
  end

  if fn.get(info, key, 0) then
    return "  " .. info[key] .. sym
  end

  return ""
end

-- get git head
function _G.git_head()
  local h = vim.fn["FugitiveHead"]()
  if h ~= "" then
    return "  " .. h .. " "
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
set.statusline = set.statusline .. " ~"
set.statusline = set.statusline .. " %l/%L:%c"
set.statusline = set.statusline .. " %p%%"
set.statusline = set.statusline .. " %{v:lua.git_head()}"
set.statusline = set.statusline .. "%<"

-- Use ripgrep for searching
-- https://github.com/junegunn/fzf.vim/blob/master/doc/fzf-vim.txt#L355
function _G.rgfzf(argv, fullscreen)
  local command_args = {
    "--column",
    "--line-number",
    "--no-heading",
    "--color=always",
    "-g=\"!*-lock.json\"",
    "--type-not sql",
    "--smart-case",
  }

  local extra_commands = {}
  local query = ''
  local paramlist = fn.split(argv, " ")

  if paramlist[1] == "--type" then
    extra_commands = slice_table(paramlist, 1, 3)
    query = fn.join(slice_table(paramlist, 3, #paramlist + 1), " ")
  else
    query = fn.join(paramlist, " ")
  end

  local command_fmt = 'rg ' .. fn.join(merge(command_args, extra_commands), ' ') .. ' -- %s || true'
  local initial_command = fn.printf(command_fmt, fn.shellescape(query))
  local reload_command = fn.printf(command_fmt, '{q}')
  local spec = {options = { '--phony', '--query', query, '--bind', 'change:reload:' .. reload_command }}
  fn["fzf#vim#grep"](initial_command, 1, fn["fzf#vim#with_preview"](spec), fullscreen)
end

cmd([[command! -nargs=* -bang RG call v:lua.rgfzf(<q-args>, <bang>0)]])
cmd([[nnoremap <Leader>/ :RG<Space>]])

-- vim file explorer
-- remove banner
g.netrw_banner = 0
-- disable file delete with D & capslocked hjkl
cmd([[
  function! Netrw_NOP(islocal) abort
    return ''
  endfunction
]])

g.Netrw_UserMaps = {
  { 'D', 'Netrw_NOP' },
  { 'H', 'Netrw_NOP' },
  { 'J', 'Netrw_NOP' },
  { 'K', 'Netrw_NOP' },
  { 'L', 'Netrw_NOP' },
}
