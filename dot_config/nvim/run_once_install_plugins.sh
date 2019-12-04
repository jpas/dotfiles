#!/bin/bash
set -e
set +h

echo "[INSTALL] nvim vim-plug"
curl -sfLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "[INSTALL] nvim plugins... expect \"Errors\""
cat > "$HOME/.config/nvim/plugins.vim" <<EOF
call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'ervandew/supertab'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rhysd/reply.vim'
Plug 'vim-scripts/cmdalias.vim'
Plug 'sheerun/vim-polyglot'

Plug 'airblade/vim-gitgutter'

" LaTeX
Plug 'lervag/vimtex'

" to generate tmux command line vim
Plug 'edkolev/tmuxline.vim'

Plug 'wlangstroth/vim-racket'
Plug 'Chiel92/vim-autoformat'

call plug#end()

" for lervag/vimtex
let g:polyglot_disabled = ['latex']
let g:vimtex_compiler_progname = 'nvr'
EOF

nvim --headless +PlugInstall +PlugUpdate! +PlugClean! +qa
echo