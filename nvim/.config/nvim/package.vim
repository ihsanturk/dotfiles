call plug#begin()

Plug 'Shougo/deoplete.nvim'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'qxxxb/vim-searchhi'
Plug 'krisajenkins/vim-pipe'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

"=== Deoplete =================================================================

let g:deoplete#enable_at_startup = 1

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

nm <M-f> :Files<CR>
nm <M-s> :BLines<CR>
nm <M-b> :Buffers<CR>
nm <M-r> :History<CR>
nm <M-x> :Commands<CR>
nm <M-h> :Helptags!<CR>
let  g:fzf_commands_expect = 'alt-enter'

set rtp+=/usr/local/opt/fzf " If installed using Homebrew

"=== Goyo =====================================================================

nm <M-g> :Goyo<CR>

"=== EasyAlign ================================================================

xm ga <Plug>(LiveEasyAlign)
nm ga <Plug>(LiveEasyAlign)

"=== Searchhi =================================================================

nm # <Plug>(searchhi-#)
nm * <Plug>(searchhi-*)
nm N <Plug>(searchhi-N)
nm n <Plug>(searchhi-n)
nm g# <Plug>(searchhi-g#)
nm g* <Plug>(searchhi-g*)
nm gD <Plug>(searchhi-gD)
nm gd <Plug>(searchhi-gd)
vm # <Plug>(searchhi-v-#)
vm * <Plug>(searchhi-v-*)
vm N <Plug>(searchhi-v-N)
vm n <Plug>(searchhi-v-n)
vm g# <Plug>(searchhi-v-g#)
vm g* <Plug>(searchhi-v-g*)
vm gD <Plug>(searchhi-v-gD)
vm gd <Plug>(searchhi-v-gd)
nm <C-c> mx<Plug>(searchhi-clear-all)<cr>`x

"=== Vimwiki ==================================================================

let g:vimwiki_list = [{'path': '~/Dropbox/Document/Wiki/',
	                  \ 'path_html': '~/Dropbox/Document/WikiHTML'}]
autocmd FileType vimwiki nm <leader>e :set cole=0<cr>
autocmd FileType vimwiki nm <leader>v :set cole=2<cr>
autocmd FileType vimwiki nm <leader>b :silent VimwikiAll2HTML<cr>
autocmd FileType vimwiki 
	\ nm <leader>o :silent !open ~/Dropbox/Document/WikiHTML/index.html<cr>

"================================= FORSAKEN ===================================

" Plug 'JamshedVesuna/vim-markdown-preview'
" Plug 'chriskempson/base16-vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'tpope/vim-obsession'
" Plug 'scrooloose/nerdtree'
" nm <M-3> :NERDTreeToggle<cr><C-w>=
" let NERDTreeMinimalView = 1
" let NERDTreeStatusline = " NerdTree"
" let g:NERDTreeMapActivateNode = '<space>'
" Plug 'itchyny/calendar.vim'
" Plug 'liuchengxu/vim-clap'
" Plug 'tpope/vim-surround'
" Plug 'makerj/vim-pdf'
" Plug 'dbeniamine/cheat.sh-vim'
" Plug 'HendrikPetertje/vimify'
" let g:vimwiki_list_ignore_newline=0
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'plasticboy/vim-markdown'
" Plug 'markonm/traces.vim' "Visual Ex-mode visual line issue
