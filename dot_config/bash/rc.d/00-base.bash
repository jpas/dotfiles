have() {
  which "$1" &> /dev/null
}

set -o vi

alias v='$VISUAL'
alias e='$EDITOR'

alias l='ls'
alias ll='ls -l'
alias la='ls -la'
