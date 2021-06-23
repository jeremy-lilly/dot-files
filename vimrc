" to be placed at ~/.vimrc

" download/install VimPlug if not already
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" load plugins
call plug#begin('~/.vim/plugged')
    
    Plug 'rakr/vim-one'
    Plug 'itchyny/lightline.vim'

call plug#end()

" Colors
colo one
set background=dark

" Lightline
set laststatus=2
set noshowmode
let g:lightline = {'colorscheme': 'one'}

" Allow mouse
set mouse=a

" Show line numbers
set number

" Turn off beeping
set visualbell

" Encoding
set encoding=utf-8

" Syntax highlighting
syntax on

" Detect spaces vs tab
filetype plugin indent on

" Whitespace
set wrap
set sw=4
set expandtab
set tabstop=4

" Maps
nmap ; :

" Add marker at column 80 and solid color after 120
let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn guibg=darkgrey ctermbg=darkgrey

