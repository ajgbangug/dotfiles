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
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'chase/vim-ansible-yaml'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'bling/vim-airline'
Plugin 'elzr/vim-json'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-vinegar'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'marijnh/tern_for_vim'
Plugin 'chriskempson/base16-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'

call vundle#end()
filetype indent plugin on

autocmd Colorscheme * highlight clear SignColumn
autocmd ColorScheme * highlight GitGutterAdd guifg=green ctermfg=green
autocmd ColorScheme * highlight GitGutterChange guifg=yellow ctermfg=yellow
autocmd ColorScheme * highlight GitGutterDelete guifg=red ctermfg=red
autocmd ColorScheme * highlight GitGutterChangeDelete guifg=yellow ctermfg=yellow

set background=light
colorscheme solarized

" syntax highlighting and indentation options
syntax on

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
    set guifont=Monaco\ for\ Powerline:h12
  elseif has('gui_gtk2')
    set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 12
  endif
  let g:airline_powerline_fonts = 1
endif

" set leader key
let mapleader = ","

let g:netrw_preview = 1

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
