"=== Standart mappings ========================================================

nn <Space>       za
vn <Space>       za
cm <M-backspace> <C-w>
im <C-d>         <Del>
im <M-backspace> <C-w>
im <C-a>         <esc>I
im <C-b>         <Left>
im <C-d>         <C-o>x
im <C-e>         <esc>A
nm *             *<c-o>
nm <M-S-o>       <C-w>p
nm <M-o>         <C-w>w
nn <leader>z     zMzvzz
im <C-f>         <Right>
im <M-d>         <C-o>de
cm <M-b>         <S-Left>
im <M-b>         <S-Left>
cm <M-f>         <S-Right>
im <M-f>         <S-Right>
tno <Esc>        <C-\><C-n>
im <M-o>         <esc><C-w>w
tmap <M-o>       <C-\><C-n><C-w>w
nm <leader>i     /)<Return>:noh<cr>i
nn <leader>t     :5new<cr>:r! tureng 
nm <M-1>         :set cursorcolumn!<cr>
nm <M-k>         :bp<bar>sp<bar>bn<bar>bd<cr>
nm <leader>r     :so ~/.config/nvim/init.vim<cr>:noh<cr>
vn <leader>s :!awk '{ print length(), $0\|"sort -n" }'\|cut -d' ' -f2-<cr>
nm <M-t>     :let $DIR=expand('%:p:h')<cr>:vs +ter<cr>cd $DIR;tput clear<cr>
nn <leader>d :exec 'normal a'.system("date '+%Y %b %d %X' \| tr -d '\n'")<cr>
vn <leader>t :let $PHRASE=getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]]<cr>:5new<cr>:r! tureng $PHRASE<cr>

"=== Scroll with keeping where cursor is ======================================

nm <C-j> <C-e>j
nm <C-k> <C-y>k

"=== Autohighlight ============================================================

nm <leader>/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<cr>
function! AutoHighlightToggle()
	if exists('#auto_highlight')
		au! auto_highlight
		augroup! auto_highlight
		setl updatetime=20
		echo 'Highlight current word: off'
		return 0
	else
		augroup auto_highlight
			au!
			au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
		augroup end
		setl updatetime=20
		echo 'Highlight current word: ON'
		return 1
	endif
endfunction

"=== Easier inside and around selection =======================================

vn i2  i"
vn a2  a"
nn ci2 ci"
nn ca2 ca"
nn di2 di"
nn da2 da"
nn yi2 yi"
nn ya2 ya"
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

"=== Ex/command mode ==========================================================

cnorea Q   q
cnorea W   w
cnorea E   e
cnorea Q!  q!
cnorea Qa  qa
cnorea qw  wq
cnorea Wq  wq
cnorea man Man
cnorea cdc cd %:p:h

"================================== FORSAKEN ==================================

" nm <S-Tab>       :bp<cr>
" nm <Tab>         :bn<cr>
" nm <esc><esc>    :noh
" tmap <M-S-o>     <C-w>p
