call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

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
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/cmdalias.vim'

" to generate tmux command line vim
Plug 'edkolev/tmuxline.vim'
call plug#end()

" colours
syntax on
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set t_Co=256
colorscheme onehalfdark
let g:lightline = { 'colorscheme': 'onehalfdark' }

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
