se sb
se lbr
se scs
se spr
se tgc
se wic
se list
se so=1
se wmnu
se nowrap
se ttm=10
syntax on
se mouse=a
se sbr=↪
se cocu=ncv
se t_Co=256
se noswapfile
se icm=nosplit
setg fenc=utf-8
filetype plugin indent on
se ls=0 " Disable statusbar
se backspace=indent,eol,start
se ic " Search case insensitive.
se noet ts=3 sts=3 sw=3 " Tabs look 3s.
au FileType netrw sel bufhidden=delete " Netrw should be a buffer
se lcs=tab:\|\ ,eol:\ ,extends:❯,precedes:❮ " Forsaken chars: ▸¬
au FileType vim se tw=79 " Wrap automatically if text beyonds the limit.

"=== Terminal Buffer Improvements =============================================

aug custom_term
	au!
	au BufWinEnter,WinEnter,TermOpen term://* start
	au TermOpen * selocal bufhidden=hide
aug END

fun! TermTest(cmd)
	cal termopen(a:cmd, {'on_exit': 's:OnExit'})
endf
fun! s:OnExit(job_id, code, event) dict
	if a:code == 0
		clo
	en
endf

"=== Variables ================================================================

let mapleader = '\'
let g:netrw_liststyle=3
let g:is_posix = 1 "shell
let g:netrw_dirhistmax = 0

"=== Appearance ===============================================================

color gruvbox-dark-hard-modified

"=== se scripts to be executable from the shell ==============================

au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | sil
			\ !chmod +x <afile> | en | endif

"=== Assumes se ignorecase smartcase =========================================

aug dynamic_smartcase
	au!
	au CmdLineEnter : se nosmartcase
	au CmdLineLeave : se smartcase
aug END

"=== Jump/remember to the last position =======================================

au BufReadPost * if line("'\"") > 1 && 
			\ line("'\"") <= line("$") | exe "normal! g'\"zz" | en

"=== 80 column rule ===========================================================

if exists('+colorcolumn')
	se cc=80
else
	au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
en

"=== Persistent undo ==========================================================

if has('persistent_undo')
	se udf
	se udir=~/.cache/vim
en
if has('unnamedplus')
	se cb=unnamed,unnamedplus
en
scripte utf-8

"================================== FORSAKEN ==================================

" se autochdir "relative path
" se foldlevelstart=0
" se foldlevelstart=99
" se foldmethod=indent
" se timeout " Default is already on
" se hlsearch " Default is already on
" se ttimeout " Default is already on
" se wildmenu " Default is already on
" se autoindent " Default is already on
" se nocursorline " Default is already off
" se timeoutlen=1000 " Default is already 1000
" se background=dark " Default is already dark
" se shell=/usr/local/bin/zsh " removed from neovim see also: vim-differences
