set nocompatible
syntax enable

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'
Plugin 'mileszs/ack.vim'
Plugin 'wikitopian/hardmode'
Plugin 'tpope/vim-dispatch'
Plugin 'mustache/vim-mustache-handlebars'

call vundle#end()

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
nnoremap <leader>d :Dispatch<space>

"" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h

"" exclude directories from ctrl p
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/fixtures/*,*/node_modules/*
nnoremap <c-l> <c-w>l

"" Key mappings for vim-rspec
map <Leader>. :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "Dispatch bundle exec rspec {spec}"

"" Turn on syntax highlighting for go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
