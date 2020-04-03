" ============================================================================
" File:        mapping.vim
" Description: vim mappings
" Author:      ihsan <ihsanl at pm dot me>
" License:     MIT license
" ============================================================================

" Section: Standart mappings {{{1

nm * *<c-o>
nn <Space> za
vn <Space> za
nn <C-h> 2zh2h
nn <C-l> 2zl2l
nm <M-o> <C-w>w
nn <C-Space> zM
nm <M-n> :bn<cr>
nm <M-p> :bp<cr>
nn <M-n> :bn<cr>
nm <M-S-o> <C-w>p
nn <M-Space> zMzo
nn <M-c> :make<cr>
nn <leader>z zMzvzz
im <M-o> <esc><C-w>w
nn gf :e <cfile><cr>
tno <Esc> <C-\><C-n>
nm <leader>b :r!brain 
tma <M-o> <C-\><C-n><C-w>w
nn <leader>e :se cole=0<cr>
nn <leader>v :se cole=3<cr>
vn gs :!sortlength<cr><C-l>
tma <M-S-o> <C-\><C-n><C-w>p
nm <M-1> :set cursorcolumn!<cr>
nn gsr mx:'{+1,'}-1!sort -R<cr>`x
nn gsl mx:'{+1,'}-1!sortlength<cr>`x
nm <leader>r :so ~/.config/nvim/init.vim<cr>:noh<cr>
nm <leader>i :so ~/.config/nvim/init.vim<cr>:PlugInstall<cr>
nn <leader>c :topleft 45vs :enew \|:setl nornu nonu<cr><C-w>w
nm <M-t> :let $DIR=expand('%:p:h')<cr>:bo 13sp +ter<cr>cd $DIR;tput clear<cr>
nn <leader>d :exe 'normal a'.system("date '+%Y %b %d %X'\|tr -d '\n'")<cr><cr>

" }}}
" Section: Scroll with pivot {{{1

nm <C-j> <C-e>j
nm <C-k> <C-y>k

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
au FileType python nm <return> mxyap<C-w>wpi<cr><esc><C-w>w`x
au FileType python vn <return> y<C-w>wpi<cr><esc><C-w>w

" }}}
" FORSAKEN {{{1

" nm <esc><esc> :noh
" nm <M-k> :bp<bar>sp<bar>bn<bar>bd<cr> "Using a plugin for that see: packages

" }}}

" vim: set fdm=marker :
