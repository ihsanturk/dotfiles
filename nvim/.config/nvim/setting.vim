syntax on
set nolist
set nowrap
set mouse=a
set timeout
set hlsearch
set t_Co=256
set ttimeout
set wildmenu
set expandtab
set incsearch
set linebreak
set smartcase
set autoindent
set cursorline
set ignorecase
set noswapfile
set splitbelow
set splitright
set tabstop=3 
set scrolloff=3
set shiftwidth=3
set showbreak=↪
set termguicolors
set ttimeoutlen=10
set background=dark
set timeoutlen=1000
set foldlevelstart=0
set foldlevelstart=99
" set foldmethod=syntax
filetype plugin indent on
set autochdir "relative path
set shell=/usr/local/bin/zsh
setglobal fileencoding=utf-8
set backspace=indent,eol,start
autocmd InsertEnter,InsertLeave * set cul!
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set inccommand=nosplit "Wow, I've been looking for so long for this setting.


colorscheme base16-gruvbox-dark-hard
let mapleader = '\'

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"


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
