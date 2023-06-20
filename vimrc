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
    Plug 'lervag/vimtex'
    Plug 'preservim/nerdtree'
    Plug 'SirVer/ultisnips'
    Plug 'ackyshake/VimCompletesMe'
    Plug 'Valloric/YouCompleteMe'
    Plug 'ervandew/supertab'
    "Plug 'dense-analysis/ale'

call plug#end()


" turn on filetype detection
filetype plugin indent on


" syntax highlighting
syntax on


" encoding
set encoding=utf-8


" allow mouse
set mouse=a


" Show line numbers
set number


" Turn off beeping
set visualbell


" whitespace
set wrap
set sw=4
set expandtab
set tabstop=4


" maps
nmap ; :


" colors
colorscheme one
set background=dark
let g:one_allow_italics=1
" popup menu
call one#highlight('Pmenu', 'ffffff', '242424', 'none')
call one#highlight('PmenuSel', 'dfdfdf', '333333', 'none')
" spellcheck
highlight clear SpellBad
highlight SpellBad cterm=underline ctermfg=red
set spell spelllang=en_us
" add marker at column 80 and 120
highlight ColorColumn ctermbg=darkgray
command Rule set cc=80,120
command RuleOff set cc=


""" lightline
set laststatus=2
set noshowmode
let g:lightline={'colorscheme': 'one'}


""" vimtex config
let g:vimtex_quickfix_open_on_warning=0
let g:vimtex_view_method = 'zathura'
" add/remove closing brace on completion
let g:vimtex_complete_close_braces=0
" close quickfix window after keystrokes
let g:vimtex_quickfix_autoclose_after_keystrokes=1
" run VimtexClean on exit
autocmd VimLeave *.tex :VimtexClean

" start client server so we can use
" backward search synctex
"if empty(v:servername) && exists('*remote_startserver')
"    call remote_startserver('VIM')
"endif


""" nerdtree config
nnoremap <leader>nn :NERDTreeToggle<CR>
" start NERDTree when vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif


""" ultisnips
" change trigger from <tab>, which is used by YCM
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
" split edit window horizontally 
let g:UltiSnipsEditSplit='horizontal'


""" vimcompletesme
augroup VimCompletesMeTex
    autocmd!
    autocmd FileType tex
        \ let b:vcm_omni_pattern = g:vimtex#re#youcompleteme
augroup END


""" youcompleteme
" on first install, need to compile with
"   cd ~/.vim/plugged/YouCompleteMe
"   python3 install.py --all
" allow completion with vimtex
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme


" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

