# Zsh config (managed via GNU Stow)

[[ -n "$ZSH_PROFILE" ]] && zmodload zsh/zprof

# Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[[ ! -d "$ZINIT_HOME" ]] && mkdir -p "$(dirname "$ZINIT_HOME")"
[[ ! -d "$ZINIT_HOME/.git" ]] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-autosuggestions
zinit ice wait'0' lucid
zinit light zsh-users/zsh-completions
zinit light zdharma-continuum/fast-syntax-highlighting

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH=$HOME/.opencode/bin:$PATH

# asdf
. ${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang/set-env.zsh
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# History
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history

# Gemeral Aliases
alias s="source ~/.zshrc"
alias l="eza -lah"
alias ls="eza"
alias sl=ls
alias zed=zeditor

# Docker Aliases
alias d="docker"
alias dc="docker compose"

# k8s
alias k="kubectl"
alias kc="kubectx"
alias kn="kubens"

# Git Aliases
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

# Functions
function take {
  mkdir -p "$1"
  cd "$1"
}

# Git Worktree Add
function gwadd() {
  local base_branch="${2:-origin/main}"
  if gwa -b $1 $1 $base_branch; then
    cd ./$1
  fi
}

eval "$(fzf --zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

[[ -n "$ZSH_PROFILE" ]] && zprof

export NVM_DIR="$HOME/.nvm"
_lazy_load_nvm() {
  unset -f nvm node npm npx pnpm yarn corepack
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
}

for cmd in nvm node npm npx pnpm yarn corepack; do
  eval "$cmd() { _lazy_load_nvm; $cmd \"\$@\"; }"
done
