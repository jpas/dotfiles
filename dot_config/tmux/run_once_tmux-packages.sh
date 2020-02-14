#!/bin/sh

export TMUX_PLUGIN_MANAGER_PATH="$HOME/.local/share/tmux/plugins"

if ! [[ -d "$TMUX_PLUGIN_MANAGER_PATH/tpm" ]]; then
  mkdir -p "$TMUX_PLUGIN_MANAGER_PATH"
  git clone https://github.com/tmux-plugins/tpm \
    "$TMUX_PLUGIN_MANAGER_PATH/tpm"
fi

cat > "$HOME/.config/tmux/plugins.conf" <<EOF
set-environment -g TMUX_PLUGIN_MANAGER_PATH \
    "$TMUX_PLUGIN_MANAGER_PATH"

run "$TMUX_PLUGIN_MANAGER_PATH/tpm/tpm"

set -g @tpm_plugins '\
         tmux-plugins/tpm \
         tmux-plugins/tmux-sensible \
         tmux-plugins/tmux-yank  \
         tmux-plugins/tmux-pain-control \
'
EOF

export PATH="$TMUX_PLUGIN_MANAGER_PATH/tpm/bin:$PATH"

install_plugins
clean_plugins
