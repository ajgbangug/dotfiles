" use vi instead of vim
set nocompatible
filetype off

" this is for vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'vim-ruby/vim-ruby'
Plugin 'chase/vim-ansible-yaml'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'bling/vim-airline'
Plugin 'elzr/vim-json'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-vinegar'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'marijnh/tern_for_vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mhinz/vim-signify'
Plugin 'Raimondi/delimitMate'
Plugin 'tomtom/tcomment_vim'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'fatih/vim-go'
Plugin 'whatyouhide/vim-gotham'
Plugin 'chriskempson/base16-vim'

call vundle#end()
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
    set guifont=Menlo:h11
  elseif has('gui_gtk2')
    set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 12
  endif
endif

" syntax highlighting and indentation options
let g:solarized_italic=0
syntax on
set background=dark
colorscheme solarized

let g:airline_powerline_fonts = 0
let g:airline_theme = "dark"
let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:netrw_preview = 1
let g:netrw_hide = 1
let g:netrw_list_hide = '.*\.pyc$'

" make ctrlp fuzzyfind in the current directory
let g:ctrl_p_working_path_mode = 'ra'

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<c-b>'
let g:UltiSnipsJumpBackwardTrigger = '<c-z>'

let g:ctrlp_custom_ignore = 'target\|git\|.*\.pyc\|.*\.class'

let g:syntastic_python_checkers = ['python', 'flake8', 'pylint']

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
