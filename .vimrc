" use vi instead of vim
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'chase/vim-ansible-yaml'
Plug 'davidhalter/jedi-vim'
Plug 'dracula/vim'
Plug 'elzr/vim-json'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'honza/vim-snippets'
Plug 'jelera/vim-javascript-syntax'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'marijnh/tern_for_vim'
Plug 'mhinz/vim-signify'
Plug 'pangloss/vim-javascript'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'tomasr/molokai'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'trusktr/seti.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'whatyouhide/vim-gotham'
Plug 'reedes/vim-colors-pencil'

call plug#end()

filetype indent plugin on

function! GetRunningOS()
  if has("win32")
    return "win"
  endif
  if has("unix")
    if system('uname')=~ 'Darwin'
      return "mac"
    else
      return "linux"
    endif
  endif
endfunction
let os=GetRunningOS()

" gui settings
if has('gui_running')
  if has('gui_macvim')
    set guifont=Luculent:h13
  elseif has('gui_gtk2')
    set guifont=Luculent\ 13
  endif
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
endif

" syntax highlighting and indentation options
syntax on
set background=dark
colorscheme molokai

set colorcolumn=80

let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1

let g:netrw_preview = 1
let g:netrw_hide = 1
let g:netrw_list_hide = '.*\.pyc$'

" make ctrlp fuzzyfind in the current directory
let g:ctrl_p_working_path_mode = 'ra'

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<c-b>'
let g:UltiSnipsJumpBackwardTrigger = '<c-z>'

let g:ctrlp_custom_ignore = 'target\|git\|.*\.pyc\|.*\.class'

let g:syntastic_python_checkers = ['python', 'flake8']

" turn off blinking cursor
set gcr=a:blinkon0

set hidden

set shell=/bin/zsh

set noerrorbells
set vb t_vb=

set list
set listchars=tab:▸\ ,eol:¬

" show commands as you enter them
set showcmd

" document searching options
set hlsearch
set incsearch
set ignorecase
set smartcase

" editing options
set backspace=indent,eol,start
set autoindent
set cursorline
set number
set relativenumber
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set shiftround

" split options
set splitbelow
set splitright

" limit to 80 lines (as per pep8)
set tw=0
set wrap

set foldmethod=indent
set foldlevel=99

" remove highlights made by hlsearch
nnoremap <c-n> :nohl<cr>

" remap moving between splits
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" saving with good 'ol CTRL + S
noremap <c-s> :w<cr>

" backup settings
set nobackup
set nowritebackup
set noswapfile

" use ;; instead of Esc
inoremap ;; <Esc>
vnoremap ;; <Esc>gV
onoremap ;; <Esc>
cnoremap ;; <Esc>

" always show the status line
set laststatus=2

" always show line numbers, but only in the current window
au WinEnter * setlocal number
au WinEnter * setlocal relativenumber
au WinEnter * setlocal cursorline
au WinLeave * setlocal nonumber
au WinLeave * setlocal norelativenumber
au WinLeave * setlocal nocursorline
