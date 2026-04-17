export PATH="~/.local/bin:$PATH"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# General Aliases
alias s="source ~/.zshrc"
alias l="eza -lah"
alias ls="eza"
alias sl=ls
alias zed=zeditor

# Docker
alias d="docker"
alias dc="docker compose"

# Git Alias
alias g="git"
alias ga="git add"
alias gci="git commit"
alias gco="git checkout"

alias gd="git diff"
alias gl="git log"

alias gps="git push"
alias gpso="git push --set-upstream origin HEAD"

alias gpl="git pull"
alias gplo="git pull origin"

alias gs="git status"

# Functions
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


# Zsh Plugins
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(fzf --zsh)

# Starship
eval "$(starship init zsh)"

. ${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang/set-env.zsh