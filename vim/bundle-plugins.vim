NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\   'windows' : 'make -f make_mingw32.mak',
\   'cygwin' : 'make -f make_cygwin.mak',
\   'mac' : 'make -f make_mac.mak',
\   'unix' : 'make -f make_unix.mak'
\ }
\}

NeoBundle 'itchyny/lightline.vim'

NeoBundle 'tyru/eskk.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'sudo.vim'
NeoBundle 'Shougo/vimshell.vim'

NeoBundle 'noahfrederick/vim-skeleton'
NeoBundle 'airblade/vim-rooter'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

NeoBundle 'tpope/vim-pathogen'
NeoBundle 'scrooloose/syntastic'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'

NeoBundle 'joonty/vdebug'
NeoBundle 'thinca/vim-quickrun'

NeoBundle 'grep.vim'
NeoBundle 'alpaca-tc/alpaca_tags'
NeoBundle 'majutsushi/tagbar'

NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Lokaltog/vim-easymotion'


" Docs
NeoBundle 'tpope/vim-markdown'

NeoBundle 'sukima/xmledit'
NeoBundle 'xslt'


" Configs
NeoBundle 'nginx.vim'


" C/C++
NeoBundle 'jalcine/cmake.vim'


" Golang
NeoBundle 'fatih/vim-go'
NeoBundle 'vim-jp/vim-go-extra'


" Web
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'elzr/vim-json'
NeoBundle 'kchmck/vim-coffee-script'

NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/emmet-vim'


" Node.js
NeoBundle 'moll/vim-node'


" Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-endwise'

" Ruby on Rails
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'basyura/unite-rails'

NeoBundle 'slim-template/vim-slim'
