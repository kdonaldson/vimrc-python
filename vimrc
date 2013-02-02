set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
"   General 
Bundle 'Lokaltog/powerline'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'git://git.wincent.com/command-t.git'
"   Python
Bundle 'klen/python-mode'
Bundle 'nvie/vim-flake8'
"   JavaScript
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
"   HTML
Bundle 'othree/html5.vim'
Bundle 'indenthtml.vim'
Bundle 'mutewinter/vim-css3-syntax'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" powerline
python from powerline.bindings.vim import source_plugin; source_plugin()

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed

" Open NERDTree automatically when vim starts up
autocmd vimenter * if !argc() | NERDTree | endif

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Settings for vim-powerline
set laststatus=2

" syntax highlighting
filetype plugin indent on
syntax on

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" spaces for tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


set history=700
set undolevels=700

" Turn on spelling
" This auto spell checks comments not code (so very cool)
" set spell

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

"    Python Mode
let g:pymode_lint_checker = "pyflakes,pep8,mccabe"

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
