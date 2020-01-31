set list
set tw=79
syntax on
set nowrap
set mouse=a
set timeout
set hlsearch
set t_Co=256
set ttimeout
set wildmenu
set incsearch
set linebreak
set smartcase
set autoindent
set ignorecase
set noswapfile
set splitbelow
set splitright
set scrolloff=1
set laststatus=0
set nocursorline
set showbreak=↪
set termguicolors
set ttimeoutlen=10
set background=dark
set timeoutlen=1000
set foldlevelstart=0
set foldlevelstart=99
set foldmethod=indent
filetype plugin indent on
"set autochdir "relative path
set shell=/usr/local/bin/zsh
setglobal fileencoding=utf-8
set backspace=indent,eol,start
set listchars=tab:\|\ ,eol:\ ,extends:❯,precedes:❮ "▸¬
autocmd FileType javascript,vim,zsh,html,sh,go,python,c,cpp set
			\ noexpandtab tabstop=3 softtabstop=3 shiftwidth=3
set inccommand=nosplit " Wow, I've been looking for so long for this setting.

" Appearance
colorscheme gruvbox-dark-hard-modified

highlight CurrentSearch
	 \ cterm=reverse,bold ctermfg=108 ctermbg=235
	 \ gui=reverse,bold guifg=#8ec07c guibg=#282828
highlight link SearchCursor WarningMsg

" Variables
let mapleader = '\'
let g:is_posix = 1 "shell
let g:netrw_liststyle=3

" Assumes set ignorecase smartcase
augroup dynamic_smartcase
	autocmd!
	autocmd CmdLineEnter : set nosmartcase
	autocmd CmdLineLeave : set smartcase
augroup END

" jump to the last position
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 &&
				\ line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" 80 col rule
if exists('+colorcolumn')
	set colorcolumn=80
else
	au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" persistent undo
if has('persistent_undo')
	set undofile
	set undodir=~/.cache/vim
endif

if has('unnamedplus')
	set clipboard=unnamed,unnamedplus
endif
scriptencoding utf-8
