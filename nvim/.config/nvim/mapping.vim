" Scroll with staying where cursor is.
nmap <C-j> <C-e>j
nmap <C-k> <C-y>k

" autohighlight
nmap <leader>/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
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
nmap * *<c-o>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(LiveEasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(LiveEasyAlign)

vn   i2            i"
vn   a2            a"
nn   ci2           ci"
nn   ca2           ca"
nn   di2           di"
nn   da2           da"
nn   yi2           yi"
nn   ya2           ya"
vn   i9            i(
vn   i0            i)
vn   a9            a(
vn   a0            a)
nn   ci9           ci(
nn   ci0           ci)
nn   ca9           ca(
nn   ca0           ca)
nn   di9           di(
nn   di0           di)
nn   da9           da(
nn   da0           da)

nn <Space>         za
vn <Space>         za
nmap <leader>d     "_d
cmap <M-backspace> <C-w>
imap <C-d>         <Del>
imap <M-backspace> <C-w>
imap <C-b>         <Left>
nn <leader>z       zMzvzz
imap <C-f>         <Right>
imap <M-d>         <C-o>de
imap <C-e>         <esc>A
imap <C-a>         <esc>I
nmap <S-Tab>       :bp<cr>
nmap <Tab>         :bn<cr>
cmap <M-b>         <S-Left>
imap <M-b>         <S-Left>
nmap <M-S-k>       :bd<cr> 
cmap <M-f>         <S-Right>
imap <M-f>         <S-Right>
nmap <M-o>         <C-w><C-w>
tno  <Esc>         <C-\><C-n>
nmap <leader>i     /)<Return>:noh<cr>i
nmap <M-1>         :set cursorcolumn!<cr>
nmap <M-k>         :bp<bar>sp<bar>bn<bar>bd<cr>
nmap <esc><esc>    mx<Plug>(searchhi-clear-all)<cr>`x
nmap <leader>r     :so ~/.config/nvim/init.vim<cr>:noh<cr>
vn   <leader>s    :!awk '{ print length(), $0\|"sort -n" }'\|cut -d' ' -f2-<cr>

" Goyo
nmap <M-g> :Goyo<CR>

" fzf (lets make some emacs noise)
nmap <M-f> :Files<CR>
nmap <M-s> :BLines<CR>
nmap <M-b> :Buffers<CR>
nmap <M-r> :History<CR>
nmap <M-x> :Commands<CR>
nmap <M-h> :Helptags!<CR>
let  g:fzf_commands_expect = 'alt-enter'

cnorea Q   q
cnorea W   w
cnorea E   e
cnorea Q!  q!
cnorea qw  wq
cnorea Wq  wq
cnorea man Man
cnorea clap Clap
cnorea cdc cd %:p:h
