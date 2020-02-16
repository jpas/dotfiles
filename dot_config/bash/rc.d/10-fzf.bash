have fzf || return

export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --color=bg+:0"

if have fd; then
  export FZF_DEFAULT_COMMAND="fd --type f --follow"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

if [[ -n "$TMUX" ]]; then
  export FZF_TMUX=1
  export FZF_TMUX_HEIGHT=20
fi
