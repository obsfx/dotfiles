sudo apt update
sudo apt upgrade

sudo apt install curl
sudo apt install wget
sudo apt install git

git config --global user.email "balandiomer@gmail.com"
git config --global user.name "obsfx"
git config --global user.signingkey 7709B9F9CCB9413A
git config --global commit.gpgsign true

sudo apt install python3-pip
sudo apt install neovim
sudo apt install zsh

sudo apt install clangd-9
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-9 100

sudo pip3 install pynvim

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s $(which zsh) $(whoami)

mkdir ~/.config/nvim -p

curl "https://raw.githubusercontent.com/obsfx/dotfiles/master/init.vim" > ~/.config/nvim/init.vim

mkdir ~/.vim/undodir -p

echo ':PlugInstall'

echo ':CocInstall coc-css coc-json coc-html coc-tsserver coc-clangd coc-highlight coc-markdownlint coc-python coc-git|q'
