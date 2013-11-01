set nocompatible
syntax enable

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'


let mapleader = ","
let g:mapleader = ","


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
nmap <Space> :noh<cr>
nmap <leader>f :CtrlPClearCache<CR>


"" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h

"" exclude directories from ctrl p
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/fixtures/*
nnoremap <c-l> <c-w>l
