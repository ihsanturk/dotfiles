call plug#begin()

Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'
Plug 'markonm/traces.vim'
Plug 'qxxxb/vim-searchhi'
Plug 'krisajenkins/vim-pipe'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

call plug#end()

"=== Vim-Pipe =================================================================

let g:vimpipe_invoke_map = '<leader>q'
nn <M-c> :call <SID>pipe()<CR>
" Vim-pipe jump back to where I was
function! <SID>pipe()
	let line = line(".")
	let column = col(".")
	%call VimPipe()
	call cursor(line, column)
endfunc

"=== NerdCommenter ============================================================

let g:NERDSpaceDelims = 1

"=== FZF (lets make some emacs noise) =========================================

nmap <M-f> :Files<CR>
nmap <M-s> :BLines<CR>
nmap <M-b> :Buffers<CR>
nmap <M-r> :History<CR>
nmap <M-x> :Commands<CR>
nmap <M-h> :Helptags!<CR>
let  g:fzf_commands_expect = 'alt-enter'

set rtp+=/usr/local/opt/fzf " If installed using Homebrew

"=== Goyo =====================================================================

nmap <M-g> :Goyo<CR>

"=== EasyAlign ================================================================

xmap ga <Plug>(LiveEasyAlign)
nmap ga <Plug>(LiveEasyAlign)

"=== Searchhi =================================================================

nmap # <Plug>(searchhi-#)
nmap * <Plug>(searchhi-*)
nmap N <Plug>(searchhi-N)
nmap n <Plug>(searchhi-n)
nmap g# <Plug>(searchhi-g#)
nmap g* <Plug>(searchhi-g*)
nmap gD <Plug>(searchhi-gD)
nmap gd <Plug>(searchhi-gd)
vmap # <Plug>(searchhi-v-#)
vmap * <Plug>(searchhi-v-*)
vmap N <Plug>(searchhi-v-N)
vmap n <Plug>(searchhi-v-n)
vmap g# <Plug>(searchhi-v-g#)
vmap g* <Plug>(searchhi-v-g*)
vmap gD <Plug>(searchhi-v-gD)
vmap gd <Plug>(searchhi-v-gd)
nmap <C-c> mx<Plug>(searchhi-clear-all)<cr>`x

"=== Vimwiki ==================================================================

let g:vimwiki_list = [{'path': '~/Dropbox/Document/Wiki/',
	                  \ 'path_html': '~/Dropbox/Document/WikiHTML'}]
autocmd FileType vimwiki nmap <leader>e :set cole=0<cr>
autocmd FileType vimwiki nmap <leader>v :set cole=2<cr>
autocmd FileType vimwiki nmap <leader>b :silent VimwikiAll2HTML<cr>
autocmd FileType vimwiki 
	\ nmap <leader>o :silent !open ~/Dropbox/Document/WikiHTML/index.html<cr>

"================================= FORSAKEN ===================================

" Plug 'JamshedVesuna/vim-markdown-preview'
" Plug 'chriskempson/base16-vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'tpope/vim-obsession'
" Plug 'scrooloose/nerdtree'
" nmap <M-3> :NERDTreeToggle<cr><C-w>=
" let NERDTreeMinimalView = 1
" let NERDTreeStatusline = " NerdTree"
" let g:NERDTreeMapActivateNode = '<space>'
" Plug 'itchyny/calendar.vim'
" Plug 'liuchengxu/vim-clap'
" Plug 'tpope/vim-surround'
" Plug 'makerj/vim-pdf'
" Plug 'plasticboy/vim-markdown'
" Plug 'dbeniamine/cheat.sh-vim'
" Plug 'HendrikPetertje/vimify'
" let g:vimwiki_list_ignore_newline=0
