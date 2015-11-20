set encoding=utf-8
set ambiwidth=double

set fileformat=unix
set fileformats=unix,dos,mac


set visualbell t_vb=
set imdisable

set history=100

set hidden
set browsedir=buffer

set splitright
set backspace=indent,eol,start


set clipboard+=unnamed

set mouse=a
set ttymouse=xterm2


set wildmenu
set wildmode=longest,full
set completeopt=preview,menuone


set backup
set swapfile

set backupdir=$HOME/.vimbackup
set directory=$HOME/.vimbackup


set ignorecase
set smartcase

set incsearch
set hlsearch


set autoindent
set smartindent

set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set formatoptions+=mM
set formatoptions-=ro
autocmd FileType * setlocal formatoptions-=ro
