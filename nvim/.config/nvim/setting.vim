let mapleader = '\'
syntax on
set number
set nowrap
set timeout
set ttimeout
set hlsearch
set wildmenu
set incsearch
set smartcase
set tabstop=2 
set expandtab
set cursorline
set noswapfile
set ignorecase
set splitright
set splitbelow
set showbreak=↪
set scrolloff=5
set shiftwidth=2
set termguicolors
set ttimeoutlen=10
set timeoutlen=1000
set foldlevelstart=0
set foldlevelstart=99
set foldmethod=syntax
set shell=/usr/bin/zsh
setglobal fileencoding=utf-8
set backspace=indent,eol,start
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
autocmd InsertEnter,InsertLeave * set cul!

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


if has('persistent_undo')
  set undofile
  set undodir=~/.cache/vim
endif


if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif
scriptencoding utf-8
filetype plugin indent on
