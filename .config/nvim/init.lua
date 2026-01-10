-- ~/.config/nvim/init.lua

local fn = vim.fn

-- lazy.nvim bootstrap
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("config.options")
require("config.keymaps")
require("config.autocmds")

require("lazy").setup(require("plugins"), {
  defaults = { lazy = true },
  install = { colorscheme = { "gruvbox" } },
  checker = { enabled = false },
  change_detection = { enabled = false },
})

require("config.statusline")

-- theme (gruvbox plugin is eager + high priority in plugins spec)
vim.g.gruvbox_contrast_dark = "hard"
vim.cmd([[colorscheme gruvbox]])
