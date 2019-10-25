" baseline
set langmenu=en_US.UTF-8    " sets the language of the menu (gvim)
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

" Cygwin-specific options
if has("win32")
  let $CHERE_INVOKING=1
  set shell=C:\cygwin64\bin\bash.exe
  set shellcmdflag=--login\ -c
  set shellxquote=\"
  set shellslash
  let g:gitgutter_git_executable = "C:/cygwin64/bin/git.exe"
endif

" color scheme
if has("gui_running")
  color dracula
else
  set background=dark
endif

" autoopen for NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeIgnore = ['\.o$', '\.exe$', '\.ilk$', '\.pdb$', '\.dll$']

" gVim font
if has("win32")
  set guifont=Consolas:h10
endif

" MacVim font
if has("gui_macvim")
  set guifont=Monaco:h12
endif

" disable most mouse things
set mouse=c

" Syntastic options
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

" clang-format options
let g:clang_format#code_style = "google"
let g:clang_format#auto_format = 1

" autopep8 options
let g:autopep8_on_save = 1

" markdown formatting
autocmd FileType markdown,mkd call pencil#init()
autocmd FileType markdown,mkd setlocal textwidth=80
autocmd FileType markdown,mkd setlocal conceallevel=0
autocmd FileType markdown,mkd vertical resize +1

" re2c formatting
autocmd BufRead,BufNewFile *.re setlocal filetype=cpp

" perltidy automation
autocmd BufRead,BufNewFile,BufWritePost *.pl,*.plx,*.pm :%!perltidy -q

" hexmode config
let g:hexmode_patterns = '*.DIM,*.dim,*.HDS,*.hds,*.HDF,*.hdf,*.XDF,*.xdf'

" tagbar options
let g:tagbar_ctags_bin = 'C:\cygwin64\bin\ctags.exe'
cnoreabbrev tt TagbarToggle
