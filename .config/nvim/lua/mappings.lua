local g = vim.g
local map = vim.api.nvim_set_keymap
local cmd = vim.cmd

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
map("n",  "<C-n>",    ":m .+1<CR>==", {noremap = true})
map("n",  "<C-p>",    ":m .-2<CR>==", {noremap = true})
map("v",  "<C-n>",    ":m '>+1<CR>gv=gv", {noremap = true})
map("v",  "<C-p>",    ":m '<-2<CR>gv=gv", {noremap = true})
-- disable suspend
map("n",  "<C-z>",    "<NOP>", {noremap = true})
-- disable ctrl u in insert mode
map("i",  "<C-u>",    "<NOP>", {noremap = true})
-- Remap H and L (top, bottom of screen to left and right end of line)
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

--map("n",  "<Leader>s",":Files<CR>", {noremap = true})
--map("n",  "<Leader>g",":GFiles<CR>", {noremap = true})
map("n",  "<Leader>s","<cmd>Telescope find_files<CR>", {noremap = true})
map("n",  "<Leader>g","<cmd>Telescope live_grep<CR>", {noremap = true})

-- easy save
map("n",  "<Leader>w",":w<cr>", {noremap = true})
-- indentation
map("n",  ">",    ">>", {noremap = true})
map("n",  "<",     "<<", {noremap = true})
map("v",  ">",    ">gv", {noremap = true})
map("v",  "<",     "<gv", {noremap = true})
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
map("n",  "<Leader>cd", "<Plug>(coc-definition)", {silent = true})
map("n",  "<Leader>cy", "<Plug>(coc-type-definition)", {silent = true})
map("n",  "<Leader>ci", "<Plug>(coc-implementation)", {silent = true})
map("n",  "<Leader>cr", "<Plug>(coc-references)", {silent = true})
map("n",  "<Leader>cf", "<Plug>(coc-codeaction)", {silent = true})
-- diagnostics
map("n",  "<Leader>ca", ":CocDiagnostics<cr>", {silent = true})
-- fugitive
map("n",  "gs", ":Gvdiffsplit<cr>", {silent = true})
map("n",  "gl", ":Gclog<cr>", {silent = true})

-- trigger auto completion
map("i",  "<C-c>",      "coc#refresh()", {silent = true, expr = true, noremap = true})

function _G.show_doc_or_diagnostic()
  cmd([[call CocAction('doHover')]])
end

-- show if doc or diagnostic exist
map("n",  "<Leader>k",  ":call v:lua.show_doc_or_diagnostic()<CR>", {silent = true, noremap = true})
