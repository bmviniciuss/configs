export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export ZSH="$HOME/.oh-my-zsh"
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$GOROOT/bin:$GOBIN:$PATH

alias s="source ~/.zshrc"
alias ni="npm install"
alias nid="npm install -D"
alias nr="npm run"
alias c="code"
alias d="docker"

ssh-load() {
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519 
}

ZSH_THEME="spaceship"
plugins=(git sudo zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  golang
  node
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "


# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

