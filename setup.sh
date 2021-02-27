sudo apt update
sudo apt upgrade

sudo apt install curl
sudo apt install wget
sudo apt install git
sudo apt-get install ripgrep

# global gitignore
curl -o ~/.gitignore_global https://raw.githubusercontent.com/obsfx/dotfiles/master/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

git config --global user.email "balandiomer@gmail.com"
git config --global user.name "obsfx"
git config --global core.editor "vim"

sudo apt install python3-pip

sudo apt install clangd-9
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-9 100

sudo apt install neovim
mkdir ~/.vim/undodir -p
curl -o ~/.config/nvim/init.vim --create-dirs https://raw.githubusercontent.com/obsfx/dotfiles/master/.config/nvim/init.vim
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 100
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo apt install tmux
curl -o ~/.tmux.conf https://raw.githubusercontent.com/obsfx/dotfiles/master/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# gtk
curl -o ~/.config/gtk-3.0/gtk.css https://raw.githubusercontent.com/obsfx/dotfiles/master/.config/gtk-3.0/gtk.css

# st.desktop
sudo curl -o /usr/share/applications/st.desktop https://raw.githubusercontent.com/obsfx/dotfiles/master/usr/share/applications/st.desktop

# packages to compile simple terminal
# sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/st 40
sudo apt install libx11-dev
sudo apt install libxft-dev
sudo apt install ttf-ancient-fonts-symbola
sudo apt install unifont

# kitty
# sudo apt install kitty
# mkdir ~/.config/kitty
# curl "https://raw.githubusercontent.com/obsfx/dotfiles/master/kitty.conf" > ~/.config/kitty/kitty.conf

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# additional apps
sudo apt-get install font-manager
sudo apt install pavucontrol

# common lisp
sudo apt-get install sbcl
curl -o /tmp/ql.lisp http://beta.quicklisp.org/quicklisp.lisp
sbcl --no-sysinit --no-userinit --load /tmp/ql.lisp \
  --eval '(quicklisp-quickstart:install :path "~/.quicklisp")' \
  --eval '(ql:add-to-init-file)' \
  --quit
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0

# alacritty
# sudo add-apt-repository ppa:mmstick76/alacritty
# sudo apt update
# sudo apt install alacritty
# curl "https://raw.githubusercontent.com/obsfx/dotfiles/master/.alacritty.yml" > ~/.alacritty.yml

# starship.rs
curl -fsSL https://starship.rs/install.sh | bash

# .zsh config
curl -o ~/.zshrc https://raw.githubusercontent.com/obsfx/dotfiles/master/.zshrc

# regolith
sudo apt install i3xrocks-focused-window-name
sudo apt install regolith-desktop-standard
curl -o ~/.config/regolith/Xresources https://raw.githubusercontent.com/obsfx/dotfiles/master/.config/regolith/Xresources
curl -o ~/.rofi https://raw.githubusercontent.com/obsfx/dotfiles/master/.rofi
curl -o ~/.wallpapers/bg.jpg --create-dirs https://raw.githubusercontent.com/obsfx/dotfiles/master/.wallpapers/bg.jpg

sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s $(which zsh) $(whoami)
