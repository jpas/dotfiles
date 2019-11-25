#!/bin/bash
set -e
set +h

nix-have() {
  nix-env -q | grep "$(nix-env -qaPA "$1" | awk '{print $2}')" &> /dev/null
}

nix-install() {
  which nix-env &> /dev/null || return
  echo "[INSTALL] $1"
  nix-have "$1" || nix-env -iA "$1"
}

nix-install nixpkgs.bashInteractive_5
nix-install nixpkgs.exa
nix-install nixpkgs.fd
nix-install nixpkgs.fzf
nix-install nixpkgs.htop
nix-install nixpkgs.ripgrep
nix-install nixpkgs.tmux
nix-install nixpkgs._1password

nix-install nixpkgs.neovim
nix-install nixpkgs.neovim-remote

nix-install nixpkgs.bat
echo "[INSTALL] bat themes"
bat cache --build

echo "[INSTALL] tmux plugins... ish. prefix I then prefix U"
tmux_plugins="$HOME/.local/share/tmux/plugins"
if [[ -d "$tmux_plugins/tpm" ]]; then
  echo "tmux plugin manager already installed!"
else
  mkdir -p "$tmux_plugins"
  git clone https://github.com/tmux-plugins/tpm "$tmux_plugins/tpm"
fi

cat > "$HOME/.config/tmux/plugins.conf" <<EOF
set -g @tpm_plugins '\
         tmux-plugins/tpm \
         tmux-plugins/tmux-sensible \
         tmux-plugins/tmux-yank  \
         tmux-plugins/tmux-pain-control \
'
EOF
