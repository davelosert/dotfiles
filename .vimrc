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

" Start NERDtree
autocmd vimenter * NERDTree
" Focus opened File after opening NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:airline_powerline_fonts = 1
