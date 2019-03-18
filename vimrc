set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'tmhedberg/SimpylFold'
Bundle 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'  " ctrp + p => search
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
call vundle#end()
filetype plugin indent on

" BEGIN: PYTHON SETTINGS
" Line numbers
set nu
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
" See docstrings for folded code
let g:SimpylFold_docstring_preview=1
" Define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
" Flag unnecessary whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" Make auto-complete window go away when you're done with it
let g:ycm_autoclose_preview_window_after_completion=1
" Go to definition in split
let g:ycm_goto_buffer_command='split-or-existing-window'
" Leader + g goes to definition
map <leader>g :rightbelow :YcmCompleter GoToDefinitionElseDeclaration<CR>
" ignore pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '__pycache__','\~$']
" END: PYTHON SETTINGS
"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
