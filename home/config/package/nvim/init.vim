syntax on
set is
set nu
set hls
set rnu
se cc=80
set ls=1
set noet
se nowrap
set ic scs
set mouse=a
set ts=3 sw=3
" set bg=light
if has('icm')
	set icm=nosplit
end
se lcs=tab:\┊\ ,trail:•,nbsp:+
set ve+=block " select beyond the end of the line
au BufNewFile,BufRead *.nix set ts=3 sts=3 sw=3 tw=79 noet
au BufNewFile,BufRead *.py  set ts=3 sts=3 sw=3 tw=79 noet
au BufNewFile,BufRead *.vim set ts=3 sts=3 sw=3 tw=79 noet

" completion
set completeopt=menu,noselect,preview
autocmd CompleteDone * pclose

" appearance
if $COLORTERM == 'truecolor'
	set tgc
else
	set notgc
end
hi! link ColorColumn Visual
nn <silent> <c-c> :noh<cr>

" sort text-objects " TODO: pluginize-vip
nm <silent> gss :set ep=sort<cr>=
nm <silent> gsr :set ep=sort\ -R<cr>=
nm <silent> gsl :set ep=sortlength<cr>=
xn <silent> gss :<C-U>set ep=sort<cr>gv=
xn <silent> gsr :<C-U>set ep=sort\ -R<cr>gv=
xn <silent> gsl :<C-U>set ep=sortlength<cr>gv=
" ---
nm <leader>g :set ep=gt<cr>=
xn <leader>g :<C-U>set ep=gt<cr>gv=
xn <leader>w :!xargs wikipedia 2>/dev/null<cr>
nm <leader>w :exe '!wikipedia '.expand('<cword>')<cr>
" xn <leader>s :!sozlukgovtr<cr>
" nn <leader>s :exe '!sozlukgovtr '.expand('<cword>')<cr>

"abbrv
ia	teh	the
if exists("*strftime")
	ia	timestamp	<c-r>=strftime('%s')<cr>
	ia	ts	<c-r>=strftime('%s')<cr>
	ia	today	<c-r>=strftime("%Y %b %d")<cr>
	ia	now	<c-r>=strftime('%Y-%m-%d %X')<cr>
end

" cpwd -> copy pwd
cabbrev cpwd let @* = expand("%:p:h")

" cd -> tcd
cabbrev cd tcd

" typo
ca W w
ca Q q
ca WQ wq
ca Wq w
ca E e

" pivot scroll
if has('nvim') == 0 " apply just for vim
	nn <silent> <c-j> <esc><c-e>j
	nn <silent> <c-k> <esc><c-y>k
end

" write and buffer delete/close/kill buffer
cnorea wbd w\|:bd
cnorea wd w\|:bd
cnorea Wd w\|:bd
cnorea WD w\|:bd

" external commands
func! CnoreaOnlyPattern(lhs, rhs, pattern)
	exe 'cnoreabbrev <expr> '.a:lhs.
		\ ' (getcmdtype() == ":" && getcmdline() =~ "'.a:pattern.
		\ '")? "'.a:rhs.'" : "'.a:lhs.'"'
endf

call CnoreaOnlyPattern('mkdir', '!mkdir', '^mkdir$')
call CnoreaOnlyPattern('rm', '!rm', '^rm$')
call CnoreaOnlyPattern('t', '!tweet', '^t$')
call CnoreaOnlyPattern('learn', 'tcd '.$DIR_LEARN.'/', '^learn$')

" spaces to tabs
cabbrev s2t s/  /\t/g
cabbrev s4t s/    /\t/g
cabbrev s8t s/        /\t/g

" word search
nn g/ /\<\><left><left><c-r>/
