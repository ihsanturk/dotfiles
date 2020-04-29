" ============================================================================
" File:        mapping.vim
" Description: vim mappings
" Author:      ihsan <ihsanl at pm dot me>
" License:     MIT license
" ============================================================================

" Section: Standart mappings {{{1

nm j gj
nm k gk
nm * *<c-o>
nn <m-d> 0D
nn <space> za
vn <space> za
nn <c-h> 2zh2h
nn <c-l> 2zl2l
nm <m-o> <c-w>w
nn <c-space> zM
nm <m-n> :bn<cr>
nm <m-p> :bp<cr>
nn <m-n> :bn<cr>
nm <m-S-o> <c-w>p
nn <c-c> :noh<cr>
nn <m-space> zMzo
nn <m-c> :make<cr>
nn <leader>z zMzvzz
im <m-o> <esc><c-w>w
nn gf :e <cfile><cr>
tno <Esc> <c-\><c-n>
nm <m-1> :set cuc!<cr>
tma <m-o> <c-\><c-n><c-w>w
nn <leader>e :se cole=0<cr>
nn <leader>v :se cole=3<cr>
vn gs :!sortlength<cr><c-l>
tma <m-S-o> <c-\><c-n><c-w>p
nn gsr mx:'{+1,'}-1!sort -R<cr>`x
nn gsl mx:'{+1,'}-1!sortlength<cr>`x
nm <leader>r :so ~/.config/nvim/init.vim<cr>:noh<cr>
nm <leader>i :so ~/.config/nvim/init.vim<cr>:PlugInstall<cr>
nn <leader>c :topleft 44vs :enew \|:setl nornu nonu<cr><c-w>w
nm <m-t> :let $DIR=expand('%:p:h')<cr>:ter<cr>cd $DIR;tput clear<cr>
nn <leader>d :exe 'norm! a'.system("date '+%Y %b %d %X'\|tr -d '\n'")<cr><cr>

" }}}
" Section: Help {{{1

au FileType help nn <buffer> <m-k> :q<cr>

" }}}
" Section: RFC Docs {{{1

au Filetype rfc nn <buffer> <space> :;//norm! zt<cr>
au Filetype rfc nn <buffer> <c-space> :;?/norm! zt<cr>

" }}}"
" Section: Navigation {{{1
" Section: Tab navigation {{{2

nn `` `
nn `1 1gt
nn `2 2gt
nn `3 3gt
nn `4 4gt
nn `5 5gt
nn `6 6gt
nn `7 7gt
nn `8 8gt
nn `9 9gt
nn `c :tabe +ter<cr>
nn `n gt
nn `p gT
tno `` `
tno `1 1gt
tno `2 2gt
tno `3 3gt
tno `4 4gt
tno `5 5gt
tno `6 6gt
tno `7 7gt
tno `8 8gt
tno `9 9gt
tno `c :tabe +ter<cr>
tno `n gt
tno `p gT
tma `` `
tma `1 <c-\><c-n>1gt
tma `2 <c-\><c-n>2gt
tma `3 <c-\><c-n>3gt
tma `4 <c-\><c-n>4gt
tma `5 <c-\><c-n>5gt
tma `6 <c-\><c-n>6gt
tma `7 <c-\><c-n>7gt
tma `8 <c-\><c-n>8gt
tma `9 <c-\><c-n>9gt
tma `c <c-\><c-n>:tabe +ter<cr>
tma `n <c-\><c-n>gt
tma `p <c-\><c-n>gT

" }}}
" Section: Pane/window navigation {{{2

nn `h <c-w>h
nn `j <c-w>j
nn `k <c-w>k
nn `l <c-w>l
tma `h <c-\><c-n><c-w>h
tma `j <c-\><c-n><c-w>j
tma `k <c-\><c-n><c-w>k
tma `l <c-\><c-n><c-w>l

nn `b :sp +ter<cr>
nn `v :vs +ter<cr>
tma `b <c-\><c-n>:sp +ter<cr>
tma `v <c-\><c-n>:vs +ter<cr>

" }}}
" }}}
" Section: Scroll with pivot {{{1

nm <c-j> <c-e>j
nm <c-k> <c-y>k

" }}}
" Section: Auto Highlight {{{1

nm <leader>/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<cr>
func! AutoHighlightToggle()
	if exists('#auto_highlight')
		au! auto_highlight
		aug! auto_highlight
		setl updatetime=20
		echo 'Highlight current word: off'
		return 0
	el
		aug auto_highlight
			au!
			au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
		aug end
		setl updatetime=20
		echo 'Highlight current word: ON'
		retu 1
	endif
endf

" }}}
" Section: Easier text-objects on numbers {{{1

vn i9  i(
vn i0  i)
vn a9  a(
vn a0  a)
nn ci9 ci(
nn ci0 ci)
nn ca9 ca(
nn ca0 ca)
nn di9 di(
nn di0 di)
nn da9 da(
nn da0 da)

" }}}
" Section: Ex/Mommand Mode {{{1

cnorea Q   q
cnorea H   h
cnorea W   w
cnorea E   e
cnorea Q!  q!
cnorea Qa  qa
cnorea qw  wq
cnorea Wq  wq
cnorea wQ  wq
cnorea WQ  wq
cnorea man Man
cnorea cdc cd %:p:h<cr>:

" }}}
" Section: FoxDot {{{1

" Open a terminal buffer and run foxdot command with pipe option

au FileType python nm <buffer> <return> mxyap<c-w>wpi<cr><esc><c-w>w`x
au FileType python vn <buffer> <return> y<c-w>wpi<cr><esc><c-w>w

" }}}

" FORSAKEN {{{1

" nm <esc><esc> :noh
" nm <leader>b :r!brain 
" nm <m-k> :bp<bar>sp<bar>bn<bar>bd<cr> "Using a plugin for that see: packages
" nm <m-t> :let $DIR=expand('%:p:h')<cr>:bo 13sp +ter<cr>cd $DIR;tput clear<cr>

" }}}

" vim: set fdm=marker :
