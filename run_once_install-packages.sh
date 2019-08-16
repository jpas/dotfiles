#!/bin/bash

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nix-env -iA \
  nixpkgs.bat \
  nixpkgs.exa \
  nixpkgs.fd \
  nixpkgs.fzf \
  nixpkgs.htop \
  nixpkgs.neovim \
  nixpkgs.ripgrep \
  nixpkgs.tmux \
&& true
