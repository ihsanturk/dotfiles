" Autohor: ihsan <ihsanl [a_t] pm.me>
" License: public domain, use however you want.

runtime ftplugin/man.vim
runtime ftplugin/help.vim
runtime ftplugin/vim.vim

au FileType man setl nolist

set autoindent
set background=light
set cc=+1
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:\┊\ ,trail:•,nbsp:+
set nocompatible
set noswapfile
set nu rnu
set ru
set sw=3 ts=3
set tw=80
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.o,*.pdf,*.psd,*.a
set wildignore+=node_modules/*,bower_components/*
set wildmenu
syn on

color default
hi! link ColorColumn CursorColumn
hi! link Search Todo
hi! link Visual VisualNOS

set backupcopy=yes       " https://superuser.com/a/1569733/1229839

let mapleader = "\<space>"
nn <c-c> <c-[>:noh<cr><c-[>
nn <c-j> <c-e>j
nn <c-k> <c-y>k
nn <leader>d :exe 'r!date -u'\|norm kJ<cr>$
nn <leader>s :source %<cr>
nn <leader>t :exe 'r!date +\%H:\%M:\%S'\|norm kJ<cr>$
nn cn :cnext<cr>
nn cp :cprev<cr>

" readline
cnor <c-a> <c-b>
cnor <c-b> <left>
cnor <c-d> <del>
cnor <c-f> <right>
imap <c-a> <c-o>0
imap <c-b> <left>
imap <c-d> <c-o>x
imap <c-e> <c-o>$
imap <c-f> <right>

cnorea WD w\|:bd
cnorea Wd w\|:bd
cnorea cdc tcd %:p:h<cr>
cnorea wbd w\|:bd
cnorea wd w\|:bd

ca E e
ca Q q
ca SP sp
ca Sp sp
ca VS vs
ca Vs vs
ca W w
ca WQ wq
ca Wq wq
ca cd tcd

" configuration
ca rc exe 'tabe ~/dot'

" diary (todays plan)
ca tp exe 'tabe ~/zk/'.strftime('%Y-%m-%d').'.md'

" ~/log/life
ca log tabe ~/log/life \| norm G \| zz

" grave navigation
for mapmode in [ 'nn', 'tmap' ]
	exe mapmode.' <silent> `v <c-w>:vert term<cr>'
	exe mapmode.' <silent> `b <c-w>:term<cr>'
	exe mapmode.' <silent> `c <c-w>:tab term<cr>'
	exe mapmode.' <silent> `n <c-w>:tabnext<cr>'
	exe mapmode.' <silent> `p <c-w>:tabprev<cr>'
	exe mapmode.' <silent> `z <c-w>:0tabe<cr>'
	exe mapmode.' <silent> `x <c-w>:$tabe<cr>'
	for i in range(1, 8)
		exe mapmode.' <silent>`'.i.' <c-w>'.i.'gt'
	endfor
	exe mapmode.' `9 <c-w>:$tabnext<cr>'
endfor

" better :make
nn <leader>c :silent make \| unsilent redraw! \| bo cwindow<cr>
ca make silent make \| unsilent redraw! \| bo cwindow

" clear highlighting on start
noh

" [external snippet manager](https://github.com/ihsanturk/snip)
nn <leader>e :exe ':set ep=snip\ -l'.&ft<cr>=
xn <leader>e :<c-u>exe ':set ep=snip\ -l'.&ft<cr>gv=
