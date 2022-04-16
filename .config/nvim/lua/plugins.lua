local cmd = vim.cmd
local fn  = vim.fn
local execute = vim.api.nvim_command

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

  use "amadeus/vim-xml"
  use {"ericpruitt/tmux.vim", rtp = "vim/"}
  use "mattn/emmet-vim"
  use "OmniSharp/omnisharp-vim"
  use "habamax/vim-godot"
  use {"vlime/vlime", rtp = "vim/"}
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

  use 'fatih/vim-go'

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
  use "SirVer/ultisnips"
  use 'norcalli/nvim-colorizer.lua'

  use 'sjl/badwolf'
  use 'lifepillar/vim-gruvbox8'
  use 'arzg/vim-colors-xcode'
  use 'kaicataldo/material.vim'
  use 'bluz71/vim-nightfly-guicolors'
  use 'rebelot/kanagawa.nvim'

  use 'kyazdani42/nvim-web-devicons'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)
