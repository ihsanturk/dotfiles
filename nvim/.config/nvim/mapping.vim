"=== Standart mappings ========================================================

nn <Space> za
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
nm <S-Tab>       :bp<cr>
nm <Tab>         :bn<cr>
cm <M-b>         <S-Left>
im <M-b>         <S-Left>
cm <M-f>         <S-Right>
im <M-f>         <S-Right>
tno <Esc>        <C-\><C-n>
vn <leader>t :r! tureng<cr>
im <M-o>         <esc><C-w>w
tma <M-o>       <C-\><C-n><C-w>w
vn <leader>s :!sortlength<cr><C-l>
nn <leader>t     :5new<cr>:r! tureng 
nm <M-1>         :set cursorcolumn!<cr>
nm <M-k>         :bp<bar>sp<bar>bn<bar>bd<cr>
nm <leader>r     :so ~/.config/nvim/init.vim<cr>:noh<cr>
nm <M-t>     :let $DIR=expand('%:p:h')<cr>:vs +ter<cr>cd $DIR;tput clear<cr>
nn <leader>d :exec 'normal a'.system("date '+%Y %b %d %X' \| tr -d '\n'")<cr>

"=== Scroll with keeping where cursor is ======================================

nm <C-j> <C-e>j
nm <C-k> <C-y>k

"=== Autohighlight ============================================================

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

" nm <esc><esc>    :noh
" tma <M-S-o>     <C-w>p
