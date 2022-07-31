:set number
:set relativenumber
:set autoindent
:set shiftwidth=4
:set tabstop=4
:set softtabstop=4
:set smarttab
:set mouse=a
:set completeopt-=preview
:set encoding=UTF-8


call plug#begin('~/.config/nvim/plugins')

Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'ryanoasis/vim-devicons'

call plug#end()

let g:airline_powerline_fonts = 1
let g:airline_theme='deus'

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
