# set up our permissions right...
umask 027

have() {
  which "$1" &> /dev/null
}

set -o vi

alias v='$VISUAL'
alias e='$EDITOR'

alias l='ls'
alias ll='ls -l'
alias la='ls -la'

# no history
export HISTFILE=/dev/null
export LESSHISTFILE=/dev/null

export VISUAL=vim
export EDITOR=vim
export PAGER=less
export LESS=-R

export CDPATH=$HOME/school/classes
