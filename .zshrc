export ZSH="/home/obsfx/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/bin:$PATH"

export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R'

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export FZF_DEFAULT_COMMAND="rg --files -g '!/node_modules'"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export PATH=/opt/firefox/firefox:$PATH
export PATH=$PATH:/usr/local/go/bin
export VISUAL=vim
export EDITOR="$VISUAL"

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

switchnvm() {
  nvm use $(nvm list | fzf --ansi --reverse)
}

nvmil() {
  nvm install $(nvm ls-remote | grep -i 'latest' | fzf --ansi --reverse)
}

nvmiall() {
  nvm install $(nvm ls-remote | fzf --ansi --reverse)
}
