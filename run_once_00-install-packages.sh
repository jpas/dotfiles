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
nix-install nixpkgs.bat
nix-install nixpkgs.exa
nix-install nixpkgs.fd
nix-install nixpkgs.fzf
nix-install nixpkgs.htop
nix-install nixpkgs.neovim
nix-install nixpkgs.ripgrep
nix-install nixpkgs.tmux
nix-install nixpkgs._1password

echo "[INSTALL] nvim vim-plug"
curl -sfLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
