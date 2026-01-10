-- ~/.config/nvim/lua/config/keymaps.lua
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

-- fugitive maps (plugin is eager anyway)
map("n", "gs", "<cmd>Gvdiffsplit<cr>", { silent = true })
map("n", "gl", "<cmd>Gclog<cr>", { silent = true })
