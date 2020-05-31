sudo apt update
sudo apt upgrade

sudo apt install git
sudo apt install python3-pip
sudo apt install vim
sudo apt install zsh

sudo apt install clangd-9
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-9 100

sudo pip3 install pynvim

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s $(which zsh) $(whoami)

curl "https://raw.githubusercontent.com/obsfx/dotfiles/master/.vimrc" > ~/.vimrc

vim +PlugInstall

vim -c 'CocInstall -sync coc-json coc-html coc-tsserver coc-clangd coc-highlight coc-markdownlint coc-python coc-git|q'
