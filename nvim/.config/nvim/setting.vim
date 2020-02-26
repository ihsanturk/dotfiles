se ic
se sb
se lbr
se scs
se spr
se tgc
se wic
se ls=0
se so=1
se wmnu
se nocul
se cole=2
se nowrap
se ttm=10
syntax on
se cocu=nc
se mouse=a
se sbr=↪
se t_Co=256
se noswapfile
se icm=nosplit
setg fenc=utf-8
se spf=en.utf-8.add
se noet ts=3 sts=3 sw=3
filetype plugin indent on
se shell=/usr/local/bin/zsh
se backspace=indent,eol,start
se lcs=tab:\|\ ,eol:\ ,extends:❯,precedes:❮ " Forsaken chars: ▸¬
au FileType vim se tw=79 " Wrap automatically if text beyonds the limit.


"=== Follow symlinks ==========================================================

"function! s:MyFollowSymlink()
"    silent! let s:fname = resolve(expand('%:p'))
"    silent! bwipeout
"    silent! exec "edit " .s:fname
"endfunction
"command! FollowSymlink call s:MyFollowSymlink()
"
"augroup followsymlink
"    autocmd!
"    autocmd BufReadPost * FollowSymlink
"augroup END

"=== Terminal Buffer Improvements =============================================

aug custom_term
	au!
	au BufWinEnter,WinEnter,TermOpen term://* start
	au TermOpen * setl bufhidden=hide
aug END

fun! TermTest(cmd)
	cal termopen(a:cmd, {'on_exit': 's:OnExit'})
endf
fun! s:OnExit(job_id, code, event) dict
	if a:code == 0
		clo
	end
endf

"=== Variables ================================================================

let mapleader = '\'
let g:netrw_liststyle=3
let g:is_posix = 1 "shell
let g:netrw_dirhistmax = 0

"=== Appearance ===============================================================

color gruvbox-dark-hard-modified

"=== Set scripts to be executable from the shell ==============================

au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | sil
			\ !chmod +x <afile> | en | endif

"=== Assumes set ignorecase smartcase =========================================

aug dynamic_smartcase
	au!
	au CmdLineEnter : se nosmartcase
	au CmdLineLeave : se smartcase
aug END

"=== Jump/remember to the last position =======================================

au BufReadPost * if line("'\"") > 1 && 
			\ line("'\"") <= line("$") | exe "normal! g'\"zz" | end

"=== 80 column rule ===========================================================

if exists('+colorcolumn')
	se cc=80
else
	au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
end

"=== Persistent undo ==========================================================

if has('persistent_undo')
	se udf
	se udir=~/.cache/vim
end
if has('unnamedplus')
	se cb=unnamed,unnamedplus
end
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
" au FileType netrw setl bufhidden=delete " Netrw shouldn't be a buffer
