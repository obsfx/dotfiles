sudo apt update
sudo apt upgrade

sudo apt install curl
sudo apt install wget
sudo apt install git

git config --global user.email "balandiomer@gmail.com"
git config --global user.name "obsfx"

sudo apt install python3-pip
sudo apt install zsh

sudo apt install clangd-9
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-9 100

mkdir ~/.config/gtk-3.0 -p
curl "https://raw.githubusercontent.com/obsfx/dotfiles/master/.config/gtk-3.0/gtk.css" > ~/.config/gtk-3.0/gtk.css

sudo apt install neovim
mkdir ~/.vim/undodir -p
mkdir ~/.config/nvim -p
curl "https://raw.githubusercontent.com/obsfx/dotfiles/master/.config/nvim/init.vim" > ~/.config/nvim/init.vim
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 100

sudo apt install alacritty
mkdir ~/.config/alacritty -p
curl "https://raw.githubusercontent.com/obsfx/dotfiles/master/.config/alacritty/alacritty.yml" > ~/.config/alacritty/alacritty.yml

sudo apt install tmux
curl "https://raw.githubusercontent.com/obsfx/dotfiles/master/.tmux.conf" > ~/.tmux.conf

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s $(which zsh) $(whoami)
