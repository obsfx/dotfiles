vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.exrc = true
opt.guicursor = ""
-- opt.wrap = false
opt.sidescroll = 1
opt.hidden = true
opt.backup = false
opt.swapfile = false
opt.writebackup = false
opt.updatetime = 300
opt.timeoutlen = 500
opt.shortmess:append("c")
opt.tabstop = 2
opt.smarttab = true
opt.shiftwidth = 2
opt.expandtab = true
opt.number = true
opt.numberwidth = 2
opt.cmdheight = 2
opt.undodir = vim.fn.expand("~/.nvim/undodir")
opt.undofile = true
opt.cursorline = true
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.autoread = true
opt.secure = true
opt.visualbell = true
opt.errorbells = false

local map = vim.keymap.set

map("n", "<Space>", "<Nop>", { silent = true })

for _, mode in ipairs({ "n", "i" }) do
  map(mode, "<Up>", "<Nop>")
  map(mode, "<Down>", "<Nop>")
  map(mode, "<Left>", "<Nop>")
  map(mode, "<Right>", "<Nop>")
end

map("n", "<C-n>", ":m .+1<CR>==", { silent = true })
map("n", "<C-p>", ":m .-2<CR>==", { silent = true })
map("v", "<C-n>", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "<C-p>", ":m '<-2<CR>gv=gv", { silent = true })

map("n", "<C-z>", "<Nop>")
map("i", "jj", "<Esc>")

map("n", "<Leader>w", "<cmd>w<cr>", { silent = true })

map("n", ">", ">>")
map("n", "<", "<<")
map("v", ">", ">gv")
map("v", "<", "<gv")

map({ "n", "v" }, "<Leader>y", [["+y]])
map({ "n", "v" }, "<Leader>p", [["+p]])

map("n", "P", [["0p]])

map("c", "<C-h>", "<Left>")
map("c", "<C-l>", "<Right>")
