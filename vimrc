set autoindent
set cc=+1
set hlsearch
set ignorecase
set incsearch
set list
set listchars=tab:\┊\ ,trail:•,nbsp:+
set mouse=a
set nocompatible
set nu rnu
set ru
set sw=3 ts=3
set tw=80
syn on

color default
hi! link Visual VisualNOS
hi! link ColorColumn CursorColumn
hi! link Search Todo

set backupcopy=yes       " https://superuser.com/a/1569733/1229839

let mapleader = "\<space>"
nn <c-c> :noh<cr><c-[>
nn <c-j> <c-e>j
nn <c-k> <c-y>k
nn <leader>d :exe 'r!date -u'\|norm kJ<cr>$
nn <leader>t :exe 'r!date +\%H:\%M:\%S'\|norm kJ<cr>$
nn <m-c> :make<cr>        " does not work on vim
nn <m-o> <c-w><c-w>       " does not work on vim
nn cn :cnext<cr>
nn cp :cprev<cr>

" readline
imap <c-f> <right>
imap <c-b> <left>
imap <c-a> <c-o>0
imap <c-e> <c-o>$
imap <c-d> <c-o>x

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
ca Wq w
ca cd tcd

" configuration
ca rc exe 'tabe ~/dot'

" diary (todays plan)
ca tp exe 'tabe ~/zk/'.strftime('%Y-%m-%d').'.md'  " diary
