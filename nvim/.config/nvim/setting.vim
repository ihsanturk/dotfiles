" ============================================================================
" File:        setting.vim
" Description: vim settings
" Author:      ihsan <ihsanl at pm dot me>
" License:     MIT license
" ============================================================================

" Section: Standart settings {{{1

se ic
se sb
se lbr
se scs
se spr
se tgc
se wic
se ls=0
se noea
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
se fdm=marker
se noswapfile
se icm=nosplit
setg fenc=utf-8
set viminfo='1000
se spf=en.utf-8.add
se noet ts=3 sts=3 sw=3
set maxmempattern=20000
filetype plugin indent on
se shell=/usr/local/bin/zsh
se backspace=indent,eol,start
au FileType rust,python se noet ts=3 sts=3 sw=3
au FileType sql se makeprg=cat\ %\ \\\|\ mysql\ -uroot
se lcs=tab:\|\ ,eol:\ ,extends:❯,precedes:❮ " Forsaken chars: ▸¬
au FileType vimwiki,vim se tw=79 " Wrap automatically if text beyonds the limit

" Section: SQL Query {{{1

au BufWritePost ~/.query.sql 
			\ :silent!cat ~/.query.sql|mysql -turoot > ~/.query_result.txt

" Section: Template {{{1

if has("autocmd")
	aug templates
		au BufNewFile *.c    0r ~/.vim/template/skeleton.c
		au BufNewFile *.wiki 0r ~/.vim/template/skeleton.wiki
	aug END
endif

" Section: Terminal Buffer Improvements {{{1

aug custom_term
	au!
	au BufWinEnter,TermOpen term://* start
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

" Section: Variables {{{1

let mapleader = '\'
let g:netrw_liststyle=3
let g:is_posix = 1 "shell
let g:netrw_dirhistmax = 0

" Section: Appearance {{{1

color gruvbox-dark-hard-modified

" Section: Set scripts to be executable from the shell {{{1

au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | sil
			\ !chmod +x <afile> | en | endif

" Section: Assumes set ignorecase smartcase {{{1

aug dynamic_smartcase
	au!
	au CmdLineEnter : se nosmartcase
	au CmdLineLeave : se smartcase
aug END

" Section: Jump/remember to the last position {{{1

au BufReadPost * if line("'\"") > 1 && 
			\ line("'\"") <= line("$") | exe "normal! g'\"zz" | end

" Section: 80 column rule {{{1

if exists('+colorcolumn')
	se cc=80
else
	au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
end

" Section: Persistent undo {{{1

if has('persistent_undo')
	se udf
	se udir=~/.cache/vim
end
if has('unnamedplus')
	se cb=unnamed,unnamedplus
end
scripte utf-8

" FORSAKEN {{{1

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
"
" }}}

" vim: set foldmethod=marker :
