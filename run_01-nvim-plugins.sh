#!/bin/bash
set -e
echo "[INSTALL] nvim plugins"

for cmd in '+PlugUpgrade' '+PlugInstall' '+PlugUpdate!' '+PlugClean!'; do
  nvim --headless "$cmd" +qa
done

echo
