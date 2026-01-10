. "$(brew --prefix asdf)/libexec/asdf.sh"
export ZSH="/Users/omercanbalandi/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# alias ls="eza -l --group-directories-first --icons --color=always"
alias vim=nvim
export VISUAL=nvim
export EDITOR="$VISUAL"

HOME_BIN=$HOME/bin
LOCAL_BIN=$HOME/.local/bin
USR_LOCAL_GO=/usr/local/go/bin
MYSQL_BIN=/usr/local/mysql/bin
export GOPATH=$HOME/go
export PATH="$PATH:$HOME_BIN:$LOCAL_BIN:$USR_LOCAL_GO:$GOPATH/bin:$(pyenv root)/shims:$MYSQL_BIN"
export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"

eval "$(starship init zsh)"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# keybindings
bindkey -s '^F' 'cd $(find . -type d | fzf); tmux^M'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/omercanbalandi/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/omercanbalandi/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/omercanbalandi/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/omercanbalandi/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Added by Antigravity
export PATH="/Users/omercanbalandi/.antigravity/antigravity/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/omercanbalandi/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Java Development Kit
export JAVA_HOME=/opt/homebrew/opt/openjdk@17
export PATH="$JAVA_HOME/bin:$PATH"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# bun completions
[ -s "/Users/omercanbalandi/.bun/_bun" ] && source "/Users/omercanbalandi/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
