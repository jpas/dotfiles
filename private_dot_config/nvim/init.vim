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

" to generate tmux command line vim
Plug 'edkolev/tmuxline.vim'
call plug#end()

" colours
set termguicolors
syntax on
colorscheme gruvbox
let g:lightline = { 'colorscheme': 'gruvbox' }

let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = 'crosshair'
let g:tmuxline_theme = 'lightline'

set guicursor=
set encoding=utf-8
set fileencoding=utf-8
set colorcolumn=80
set number
set nowrap
set list
set cursorline
set smartcase

" rebind fzf
noremap <C-p> :FZF<cr>

" make trailing whitespace red
highlight ExtrWhitespace ctermbg=8

" I hold shift way too long...
command! W w
command! Wq wq
command! WQ wq
command! Q q
command! MAke Make
command! MAKe Make
command! MAKE Make
autocmd! VimEnter * Alias make Make
