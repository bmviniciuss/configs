export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin

# General Aliases
alias d="docker"
alias dc="docker compose"
alias s="source ~/.zshrc"
alias l="eza -lah"
alias ls="eza"
alias sl=ls

# Git Alias
alias g="git"
alias ga="git add"
alias gcm="git commit -m"
alias gco="git checkout"
alias gd="git diff"
alias gl="git log"
alias gp="git push"
alias gs="git status"
alias gst="git stash"
alias gstp="git stash pop"
alias gstl="git stash list"

function take {
  mkdir -p "$1"
  cd "$1"
}

# history
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



# Startfish
eval "$(starship init zsh)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
