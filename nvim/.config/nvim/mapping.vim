nmap n nzz
nmap N Nzz
nmap * *<c-o>

nmap <leader>d "_d
nmap <Tab> :bn<cr>
tno <Esc> <C-\><C-n>
nmap <S-Tab> :bp<cr>
nmap <leader>i /)<Return>:noh<cr>i
nmap <leader>n :NERDTreeToggle<cr><C-w>=
nmap <leader>q :bp<bar>sp<bar>bn<bar>bd<cr>
nmap <esc><esc> :noh<cr>:call clearmatches()<cr>
nmap <leader>r :so ~/.config/nvim/init.vim<cr>:noh<cr>
" meta
nmap <M-k> :bd<CR>

" folding
nn <Space> za
vn <Space> za
" focus current fold
nn <leader>z zMzvzz

" fzf (lets make some emacs noise)
nmap <M-f> :Files<CR>
nmap <M-r> :History<CR>
nmap <M-b> :Buffers<CR>
nmap <M-s> :BLines<CR>
nmap <M-h> :Helptags!<CR>
nmap <M-x> :Commands<CR>
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

map q: :q
cnorea W w
cnorea E e
cnorea Q q
cnorea qw wq
cnorea Wq wq
cnorea Q! q!

autocmd FileType c,cpp,javascript imap {} {<Return><Return>}<esc>kS
