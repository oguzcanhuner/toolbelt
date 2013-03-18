execute pathogen#infect()

let mapleader = ","
let g:mapleader = ","

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set number
let g:Powerline_symbols = 'fancy' " make powerline look nicer

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Colours
color twilight256

"" Mapping
nmap <silent> <C-t> :CtrlP<CR>
nmap <leader>t :CtrlP<CR>
nore ; :
nnoremap <leader><leader> <c-^> 
nnoremap <esc> :noh<return><esc>

"" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
