filetype plugin indent on
syntax on
"set number
set nowrap
set timeout
set ttimeout
set mouse=a
set hlsearch
set wildmenu
set incsearch
"set autochdir "relative path
set smartcase
set expandtab
set tabstop=2 
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

let mapleader = '\'

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


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
