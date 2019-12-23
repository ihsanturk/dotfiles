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

nmap <leader>d  "_d
nmap <M-S-k>    :bd<cr>
nmap <S-Tab>    :bp<cr>
nmap <Tab>      :bn<cr>
nmap <esc><esc> :noh<cr>
nmap <M-o>      <C-w><C-w>
tno  <Esc>      <C-\><C-n>
nmap <leader>i  /)<Return>:noh<cr>i
nmap <M-1>      :set cursorcolumn!<cr>
nmap <M-3>      :NERDTreeToggle<cr><C-w>=
nmap <M-k>      :bp<bar>sp<bar>bn<bar>bd<cr>
nmap <leader>r  :so ~/.config/nvim/init.vim<cr>:noh<cr>
vn   <leader>s  :!awk '{ print length(), $0\|"sort -n" }'\|cut -d' ' -f2-<cr>

" folding
nn <Space> za
vn <Space> za
nn <leader>z zMzvzz
" focus current fold

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

map    q:  :q
cnorea E   e
cnorea man Man
cnorea Q   q
cnorea W   w
cnorea Q!  q!
cnorea qw  wq
cnorea Wq  wq

autocmd FileType c,cpp,javascript imap {} {<Return><Return>}<esc>kS

