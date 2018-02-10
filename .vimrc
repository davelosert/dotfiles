execute pathogen#infect()
syntax enable
filetype plugin indent on

let g:solarized_termtrans=1
set background=dark
colorscheme solarized

set hidden
set history=100
set number
set relativenumber
set laststatus=2
set ignorecase
set smartcase

set expandtab 
set tabstop=2 
set shiftwidth=2 
set softtabstop=2

let g:airline_powerline_fonts = 1

inoremap jk <ESC>
let mapleader = "\<Space>"

au BufNewFile,BufRead *.groovy  setf groovy 
au BufNewFile,BufRead Jenkinsfile  setf Jenkinsfile 

