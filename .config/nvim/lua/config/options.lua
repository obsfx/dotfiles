-- ~/.config/nvim/lua/config/options.lua
local cmd = vim.cmd

vim.g.mapleader = " "

vim.opt.exrc = true
vim.opt.secure = true

vim.opt.guicursor = ""
vim.opt.wrap = false
vim.opt.scroll = 1
vim.opt.hidden = true

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.undofile = true

vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.shortmess:append("c")

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.number = true
vim.opt.encoding = "UTF-8"
vim.opt.cmdheight = 2
vim.opt.background = "dark"
vim.opt.cursorline = true
vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.autoread = true
vim.opt.mouse = "a"
vim.opt.termguicolors = true

vim.opt.list = true
vim.opt.listchars = { tab = "> ", trail = "·", eol = "¬", space = "⋅", nbsp = "·" }

-- tmux true color
cmd([[let $NVIM_TUI_ENABLE_TRUE_COLOR=1]])
cmd([[
  if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
]])
