" use vi instead of vim
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'NLKNguyen/papercolor-theme'
Plug 'Raimondi/delimitMate'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elzr/vim-json'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-signify'
Plug 'neomake/neomake'
Plug 'pangloss/vim-javascript'
Plug 'rking/ag.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-ruby/vim-ruby'
call plug#end()

filetype indent plugin on

function! GetRunningOS()
  if has("win32")
    return "win"
  endif
  if has("unix")
    if system('uname') =~ 'Darwin'
      return "mac"
    else
      return "linux"
    endif
  endif
endfunction

let os=GetRunningOS()

if has('gui_running')
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
endif

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"if (empty($TMUX))
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
"endif

" syntax highlighting and indentation options
syntax on
set background=dark
colorscheme PaperColor

if (has("nvim"))
  let g:python_host_prog = $PYENV_ROOT."/versions/neovim2/bin/python"
  let g:python3_host_prog = $PYENV_ROOT."/versions/neovim3/bin/python"
  " let g:ruby_host_prog = $HOME."/.rbenv/shims/ruby"
endif

set colorcolumn=80

" Run Neomake whenever a file is saved
autocmd! BufWritePost * Neomake

let g:netrw_preview = 1
let g:netrw_hide = 1
let g:netrw_list_hide = '.*\.pyc$'

" make ctrlp fuzzyfind in the current directory
let g:ctrl_p_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = 'target\|git\|.*\.pyc\|.*\.class'

" neomake settings
let g:neomake_python_enabled_makers = ['python', 'flake8']

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
