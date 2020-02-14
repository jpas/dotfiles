BLACK="\[\e[0;30m\]"
RED="\[\e[0;31m\]"
GREEN="\[\e[0;32m\]"
YELLOW="\[\e[0;33m\]"
BLUE="\[\e[0;34m\]"
MAGENTA="\[\e[0;35m\]"
CYAN="\[\e[0;36m\]"
WHITE="\[\e[0;37m\]"
RESET="\[\e[0m\]"

__prompt_generate() {
  local status=$?
  local prompt=""

  if [[ -n "$SSH_TTY" ]]; then
    prompt+="${BLUE}\u${RESET} at ${CYAN}\h${RESET} in "
  fi

  prompt+="${GREEN}\w${RESET}"

  local git_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if [[ -n "$git_branch" ]]; then
    prompt+=" on ${YELLOW}${git_branch}${RESET}"
  fi

  if [[ "$status" != "0" ]]; then
    prompt+="\n${RED}‡${RESET} "
  else
    prompt+="\n${MAGENTA}‡${RESET} "
  fi

  printf "%s" "${prompt}"
}

__prompt_update() {
  if [[ -z "$TMUX" ]]; then
    printf '\e]0;%s\a' "$(whoami) at $(hostname -s)"
  fi
  PS1="$(__prompt_generate)"
}

export PROMPT_COMMAND='__prompt_update'
