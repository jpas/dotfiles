if ! have fzf; then
  return
fi

export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --color=bg+:0"

if have fd; then
export FZF_DEFAULT_COMMAND="fd --type f --follow"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

if [[ -n "$TMUX" ]]; then
export FZF_TMUX=1
export FZF_TMUX_HEIGHT=20
fi

fzf_shell=$HOME/.fzf
if have nix; then
fzf_shell=$HOME/.nix-profile/share/fzf
elif have brew; then
fzf_shell=/usr/local/opt/fzf/shell
fi

fzf_completion=$fzf_shell/completion.bash
[[ -f "$fzf_completion" ]] && source "$fzf_completion"

fzf_key_bindings=$fzf_shell/key-bindings.bash
[[ -f "$fzf_key_bindings" ]] && source "$fzf_key_bindings"
