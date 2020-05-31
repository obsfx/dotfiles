sudo apt update
sudo apt upgrade

sudo apt install git
sudo apt install python3-pip
sudo apt install vim
sudo apt install zsh

sudo apt install clangd-9
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-9 100

sudo pip3 install pynvim
sudo pip3 install -U jedi-language-server

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

NVMCONFIG='export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' 

echo NVMCONFIG >> ~/.bashrc 
echo NVMCONFIG >> ~/.zshrc

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s $(which zsh) $(whoami)

curl "https://raw.githubusercontent.com/obsfx/dotfiles/master/.vimrc" > ~/.vimrc

vim -c 'CocInstall -sync coc-json coc-html coc-tsserver coc-clangd coc-highlight coc-markdownlint coc-python coc-git|q'
