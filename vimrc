" baseline
set langmenu=en_US.UTF-8    " sets the language of the menu (gvim)
syntax on
filetype plugin indent on
set number
set encoding=utf-8
set colorcolumn=81

" install packages
call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'scrooloose/nerdtree'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tpope/vim-sensible'
Plug 'rhysd/vim-clang-format'
Plug 'reedes/vim-pencil'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'google/vim-jsonnet'
Plug 'prettier/vim-prettier'

call plug#end()

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

" clang-format options
let g:clang_format#code_style = "google"
let g:clang_format#auto_format = 0
autocmd FileType c,cpp ClangFormatAutoEnable

" markdown formatting
autocmd FileType markdown,mkd call pencil#init()
autocmd FileType markdown,mkd setlocal textwidth=80
autocmd FileType markdown,mkd setlocal conceallevel=0
autocmd FileType markdown,mkd vertical resize +1

" re2c formatting
autocmd BufRead,BufNewFile *.re setlocal filetype=cpp

" tagbar options
let g:tagbar_ctags_bin = 'C:\cygwin64\bin\ctags.exe'
cnoreabbrev tt TagbarToggle

" preset for writing
function Imwriting()
  NERDTreeClose
  Goyo
  Limelight
  PencilSoft
endfunction
cnoreabbrev imwriting call Imwriting()
