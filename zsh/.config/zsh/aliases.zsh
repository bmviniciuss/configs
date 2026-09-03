# General
alias s="exec zsh"

if (( $+commands[eza] )); then
  alias ls="eza --group-directories-first"
  alias l="eza -lah --group-directories-first"
  alias sl=ls
fi

# Docker
alias d="docker"
alias dc="docker compose"

# k8s
alias k="kubectl"
alias kc="kubectx"
alias kn="kubens"

# Git
alias g="git"
alias ga="git add"
alias gs="git status"
alias gci="git commit"
alias gco="git checkout"
alias gd="git diff"
alias gl="git log"

alias gf="git fetch"
alias gfo="git fetch origin"

alias gb="git branch"
alias gbd="git branch -d"

alias gps="git push"
alias gpso="git push --set-upstream origin HEAD"

alias gpl="git pull"
alias gplo="git pull origin"

alias gw="git worktree"
alias gwa="git worktree add"
alias gwr="git worktree remove"
alias gwl="git worktree list"
