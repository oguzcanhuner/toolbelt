set nocompatible
syntax enable

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'
" Plugin 'tpope/vim-dispatch'
Bundle 'jgdavey/tslime.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'elzr/vim-json'
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-fugitive'
Plugin 'preservim/nerdtree'

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
set expandtab                   " uke spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Colours
color jellybeans

"" Mapping
nmap <leader>t :Files<CR>
nmap <leader>r :Ag<CR>
nore ; :
nnoremap <leader><leader> <c-^>
nmap <Space> :noh<cr>
nmap <leader>f :CtrlPClearCache<CR>
vnoremap <C-c> "*y

"" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h

"" exclude directories from ctrl p
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/fixtures/*,*/node_modules/*,*/env/*
nnoremap <c-l> <c-w>l

"" Key mappings for vim-rspec
map <Leader>. :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:rspec_runner = "os_x_iterm2"
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'

"" Linting
"let g:ale_ruby_rubocop_executable = 'bundle'
nmap <silent> <leader>l :ALEFix<CR>
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '>>'
let g:ale_fix_on_save = 1
let g:ale_history_enabled = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_open_list = 0
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'ruby': ['rubocop']}
let g:ale_linters = {'jsx': ['stylelint', 'eslint']}
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}

"" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>

"" tslime for running specs in tmux panes
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

set rtp+=/usr/local/opt/fzf
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git -o -name .expo \) -prune -o -print'

augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END
