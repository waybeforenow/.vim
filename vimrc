" baseline
execute pathogen#infect()
syntax on
filetype plugin indent on
set number
set encoding=utf-8
set colorcolumn=81

" tab fun
set tabstop=2
set shiftwidth=2
set expandtab
set cino=N-s,g1 " for C++ namespace{} declarations and public/private indent

" color scheme
if has("gui_running")
  color dracula
else
  set background=dark
endif

" autoopen for NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" gVim font
"set guifont=Consolas:h11

" disable most mouse things
set mouse=c

" Syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" clang-format options
let g:clang_format#code_style = "google"
let g:clang_format#auto_format = 1

" markdown formatting
autocmd FileType markdown,mkd call pencil#init()
autocmd FileType markdown,mkd setlocal textwidth=80
autocmd FileType markdown,mkd setlocal conceallevel=0
