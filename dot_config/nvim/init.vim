" generated by chezmoi run_once_install_packages.sh
source $HOME/.config/nvim/plugins.vim

" colours
set termguicolors
syntax on
syntax sync minlines=500
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

" detect Racket files as Scheme
au BufReadPost *.rkt,*.rktl set filetype=scheme
