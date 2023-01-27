TERM=screen-256color

alias vim=nvim
alias gvim=nvim-qt
export VISUAL=nvim
export EDITOR="$VISUAL"

export ZSH="/Users/omercanbalandi/.oh-my-zsh"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias kssh="kitty +kitten ssh"
export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

HOME_BIN=$HOME/bin
LOCAL_BIN=$HOME/.local/bin
USR_LOCAL_GO=/usr/local/go/bin
export MONGODBPATH="/opt/homebrew/Cellar/mongodb-community@4.4/4.4.16/bin"
export GOPATH=$HOME/go
export PATH="$PATH:$HOME_BIN:$LOCAL_BIN:$USR_LOCAL_GO:$MONGODBPATH:$GOPATH/bin"

export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R'

eval "$(starship init zsh)"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# place this after nvm initialization!
# https://stackoverflow.com/a/39519460
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

export FZF_DEFAULT_COMMAND="rg --files -g '!/node_modules'"

# https://github.com/wellle/dotfiles/blob/master/fzf.zsh#L152
# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

swbr() {
  git checkout $(git branch | fzf --ansi --reverse)
}

switchnvm() {
  nvm use $(nvm list | fzf --ansi --reverse)
}

nvmil() {
  nvm install $(nvm ls-remote | grep -i 'latest' | fzf --ansi --reverse)
}

nvmiall() {
  nvm install $(nvm ls-remote | fzf --ansi --reverse)
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# keybindings
bindkey -s '^F' 'cd $(find . -type d | fzf); tmux^M'
