cal plug#begin()

Plug 'keith/swift.vim'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'qxxxb/vim-searchhi'
Plug 'tpope/vim-fugitive'
Plug 'ihsanturk/vim-tureng'
Plug 'krisajenkins/vim-pipe'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'
Plug 'plasticboy/vim-markdown'
Plug 'ihsanturk/vim-emacs-like'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://gitlab.com/code-stats/code-stats-vim.git', { 'tag': 'v0.6.0' }

cal plug#end()

"=== Close buffer but don't close window vim-bufkill ==========================

cnorea bd BD
cnorea Bd BD
nm <M-k> :BD<cr>

"=== CodeStats ================================================================

let g:codestats_api_key = $CODESTATS_API_KEY

"=== Vim-Markdown =============================================================

let g:vim_markdown_folding_disabled = 1

"=== Deoplete =================================================================

let g:deoplete#enable_at_startup = 1

"=== Vim-Pipe =================================================================

let g:vimpipe_invoke_map = '<leader>q' " I don't use this.
nn <M-c> :cal <SID>pipe()<CR>
" Vim-pipe jump back to where I was
func! <SID>pipe()
	normal! mx
	%cal VimPipe()
	normal! `xzz
endf

"TODO change filename with variable
au FileType swift let b:vimpipe_command='swift ' . expand("%:p")
let g:vimpipe_silent = 1

"=== NerdCommenter ============================================================

let g:NERDSpaceDelims = 1

"=== FZF (lets make some emacs noise) =========================================

nm <M-f> :Files<CR>
nm <M-s> :BLines<CR>
nm <M-b> :Buffers<CR>
nm <M-r> :History<CR>
nm <M-x> :Commands<CR>
nm <M-h> :Helptags!<CR>
let g:fzf_commands_expect = 'alt-enter'
set rtp+=/usr/local/opt/fzf " If fzf installed using Homebrew

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
" Plug 'markonm/traces.vim' "Visual Ex-mode visual line issue
