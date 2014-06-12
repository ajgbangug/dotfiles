" set leader key
let mapleader = ","

" use vi instead of vim
set nocompatible

" swithcing to another buffer without saving
set hidden

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
set number
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set shiftround

" split options
set splitbelow
set splitright

" limit to 80 lines (as per pep8)
set tw=79
set colorcolumn=80

set foldmethod=indent
set foldlevel=99

" remove highlights made by hlsearch
noremap <c-n> :nohl<CR>

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
cnoremap <c-s> :w<cr>

" backup settings
set nobackup
set nowritebackup
set noswapfile

" use ;; instead of Esc
inoremap ;; <Esc>
vnoremap ;; <Esc>gV
onoremap ;; <Esc>
cnoremap ;; <Esc>

" automatically change directories when opening buffers
set autochdir

" always show the status line
set laststatus=2

" this is for vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'klen/python-mode'
Bundle 'msanders/snipmate.vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-vividchalk'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'chase/vim-ansible-yaml'
Bundle 'airblade/vim-gitgutter'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'zenorocha/dracula-theme'
Bundle 'bling/vim-airline'
Bundle 'elzr/vim-json'
Bundle 'davidhalter/jedi-vim'

" vanity settings
if has('gui_running')
    set guifont=Ubuntu\ Mono\ derivative\ Powerline:h15
    set background=dark
    set transparency=5
    colorscheme Tomorrow-Night 
    let g:airline_powerline_fonts = 1
endif

" make ctrlp fuzzyfind in the current directory
let g:ctrl_p_working_path_mode = 'ca'

let g:pymode_rope = 0

" syntax highlighting options
filetype on
filetype indent plugin on
syntax on
