set list
syntax on
set nowrap
set ttm=10
set mouse=a
set t_Co=256
set linebreak
set smartcase
set noswapfile
set splitbelow
set splitright
set scrolloff=1
set showbreak=↪
set termguicolors
set wildignorecase
set concealcursor=ncv
filetype plugin indent on
setglobal fileencoding=utf-8
set backspace=indent,eol,start
set laststatus=0 " Disable statusbar
set ignorecase " Search case insensitive.
autocmd FileType netrw setl bufhidden=delete " Netrw should be a buffer
autocmd FileType vim set tw=79 " Wrap automatically if text beyonds the limit.
set listchars=tab:\|\ ,eol:\ ,extends:❯,precedes:❮ " Forsaken chars: ▸¬

autocmd FileType 
			\ html,css,vimwiki,javascript,vim,zsh,html,sh,go,python,c,cpp
			\ set noexpandtab tabstop=3 softtabstop=3 shiftwidth=3 " Tabs look 3s.

"=== Terminal Buffer Improvements =============================================

autocmd BufWinEnter,WinEnter,TermOpen term://* startinsert

augroup custom_term
	autocmd!
	autocmd TermOpen * setlocal bufhidden=hide
augroup END

fun! TermTest(cmd)
	call termopen(a:cmd, {'on_exit': 's:OnExit'})
endfun
fun! s:OnExit(job_id, code, event) dict
	if a:code == 0
		close
	endif
endfun

"=== Variables ================================================================

let mapleader = '\'
let g:netrw_liststyle=3
let g:is_posix = 1 "shell
let g:netrw_dirhistmax = 0

"=== Appearance ===============================================================

colorscheme gruvbox-dark-hard-modified

"=== Set scripts to be executable from the shell ==============================

au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent
			\ !chmod +x <afile> | endif | endif

"=== Assumes set ignorecase smartcase =========================================

augroup dynamic_smartcase
	autocmd!
	autocmd CmdLineEnter : set nosmartcase
	autocmd CmdLineLeave : set smartcase
augroup END

"=== Jump/remember to the last position =======================================

if has("autocmd")
	au BufReadPost * if line("'\"") > 1 &&
				\ line("'\"") <= line("$") | exe "normal! g'\"zz" | endif
endif
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

"=== 80 column rule ===========================================================

if exists('+colorcolumn')
	set colorcolumn=80
else
	au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"=== Persistent undo ==========================================================

if has('persistent_undo')
	set undofile
	set undodir=~/.cache/vim
endif
if has('unnamedplus')
	set clipboard=unnamed,unnamedplus
endif
scriptencoding utf-8

"================================== FORSAKEN ==================================

" set autochdir "relative path
" set foldlevelstart=0
" set foldlevelstart=99
" set foldmethod=indent
" set timeout " Default is already on
" set hlsearch " Default is already on
" set ttimeout " Default is already on
" set wildmenu " Default is already on
" set autoindent " Default is already on
" set nocursorline " Default is already off
" set timeoutlen=1000 " Default is already 1000
" set background=dark " Default is already dark
" set shell=/usr/local/bin/zsh " removed from neovim see also: vim-differences
