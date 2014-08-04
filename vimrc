" set leader key
let mapleader = ","

" use vi instead of vim
set nocompatible
filetype off

" this is for vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'klen/python-mode'
Plugin 'msanders/snipmate.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-vividchalk'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'chase/vim-ansible-yaml'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'zenorocha/dracula-theme'
Plugin 'bling/vim-airline'
Plugin 'elzr/vim-json'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'marijnh/tern_for_vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
Plugin 'daylerees/colour-schemes', { 'rtp': 'vim/' }

call vundle#end()

" gui settings
if has('gui_running')
    set guifont=Sauce\ Code\ Powerline:h14
    set background=dark
    set transparency=1
    colorscheme base16-eighties
    let g:airline_powerline_fonts = 1
endif

colorscheme base16-eighties
set background=dark

let g:netrw_preview = 1

" NERDTree settings
map <leader>t :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeIgnore = ['\.pyc$', '\.log$']

" make ctrlp fuzzyfind in the current directory
let g:ctrl_p_working_path_mode = 'ra'

let g:pymode_rope = 0

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
call matchadd('ColorColumn', '/\%81v.\+/', 100)
set wrap

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

" syntax highlighting and indentation options
filetype indent plugin on
syntax on
