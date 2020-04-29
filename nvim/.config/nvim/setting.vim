" ============================================================================
" File:        setting.vim
" Description: vim settings
" Author:      ihsan <ihsanl at pm dot me>
" License:     MIT license
" ============================================================================

" Section: Standart settings {{{1

" To see what is the option doing press:
"    'K (Shift-k) on that word' or ':h ic'

se ic
se nu
se sb
se awa
se bri
se lbr
se rnu
se scs
se spr
se tgc
se wic
se list
se ls=0
se noea
se noru
se so=1
se wmnu
se wrap
se nocul
se nosmd
se noswf
se cole=2
se ttm=10
syntax on
se cocu=nc
se mouse=a
se sbr=↪
se sd='1000
se mmp=20000
" se t_Co=256
se fdm=marker
se icm=nosplit
setg fenc=utf-8
se bs=indent,eol,start
se noet ts=3 sts=3 sw=3
se sh=/usr/local/bin/zsh
filetype plugin indent on
let did_install_syntax_menu = 1
au FileType vimwiki,vim se tw=79
let did_install_default_menus = 1
au FileType rust,python se noet ts=3 sts=3 sw=3
se lcs=tab:⁝\ ,eol:\ ,extends:❯,precedes:❮
au FileType sql se mp=cat\ %\ \\\|\ mysql\ -uroot

" }}}
" Section: Shell Mode {{{1

au FileType sh,zsh setl com-=n:#
au FileType sh,zsh setl fo-=o

" }}}
" Section: Markdown Mode {{{1

au FileType markdown setl com-=n:#
au FileType markdown setl com-=fb:-
au FileType markdown setl com+=n:- " Auto append - in new line.
au FileType markdown setl fo+=ro
au FileType markdown setl tw=79

" }}}
" Section: Make dir if not exists {{{1

augroup Mkdir
  autocmd!
  autocmd BufWritePre *
    \ if !isdirectory(expand("<afile>:p:h")) |
        \ call mkdir(expand("<afile>:p:h"), "p") |
    \ endif
augroup END

" }}}
" Section: SQL Query {{{1

au BufWritePost ~/.query.sql 
			\ :silent!cat ~/.query.sql|mysql -turoot > ~/.query_result.txt

" }}}
" Section: Terminal Buffer Improvements {{{1

aug custom_term
	au!
	au BufEnter,TermOpen term://* start
	au TermEnter * setl nonu nornu nomod
	au TermClose * :bd!
aug END

fun! TermTest(cmd)
	cal termopen(a:cmd, {'on_exit': 's:OnExit'})
endf
fun! s:OnExit(job_id, code, event) dict
	if a:code == 0
		clo
	end
endf

" }}}
" Section: Variables {{{1

let mapleader = '\'
let g:netrw_liststyle=3
let g:is_posix = 1 "shell
let g:netrw_dirhistmax = 0

" }}}
" Section: Set scripts to be executable from the shell {{{1

au FileType sh if getline(1) =~ "^#!.*/bin/" | sil !chmod +x <afile> | en

" }}}
" Section: Assumes set ignorecase smartcase {{{1

aug dynamic_smartcase
	au!
	au CmdLineEnter : se nosmartcase
	au CmdLineLeave : se smartcase
aug END

" }}}
" Section: Jump/remember to the last position {{{1

au BufReadPost * if line("'\"") > 1 && 
			\ line("'\"") <= line("$") | exe "normal! g'\"zz" | end

" }}}
" Section: 80 column rule {{{1

if exists('+colorcolumn')
	se cc=80
else
	au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
end

" }}}
" Section: Persistent undo {{{1

if has('persistent_undo')
	se udf
	se udir=~/.cache/vim
end
if has('unnamedplus')
	se cb=unnamed,unnamedplus
end
scripte utf-8

" }}}
" Section: Appearance {{{1

se bg=dark
color gruvbox
hi ErrorMsg ctermfg=Red ctermbg=237
hi Visual gui=none cterm=none

"}}}

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
