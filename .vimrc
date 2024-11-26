syntax enable
set nu rnu
set cursorline

" Set the cursor shape to a underline
set guicursor=

set tabstop=2
set shiftwidth=2
set expandtab

call plug#begin()

Plug 'vimpostor/vim-lumen'
Plug 'ayu-theme/ayu-vim'

call plug#end()

set termguicolors
au User LumenLight let ayucolor="light" | colorscheme ayu
au User LumenDark let ayucolor="mirage" | colorscheme ayu
colorscheme ayu
