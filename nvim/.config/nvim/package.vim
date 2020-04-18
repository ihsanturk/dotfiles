" ============================================================================
" File:        package.vim
" Description: vim plugins with their options and settings
" Author:      ihsan <ihsanl at pm dot me>
" License:     MIT license
" ============================================================================

cal plug#begin()

Plug 'mhinz/vim-rfc'
Plug 'keith/swift.vim'
Plug 'sirver/ultisnips'
Plug 'godlygeek/tabular'
Plug 'mkitt/tabline.vim'
Plug 'etdev/vim-hexcolor'
Plug 'tpope/vim-fugitive'
Plug 'wellle/targets.vim'
Plug 'chrisbra/unicode.vim'
Plug 'ihsanturk/vim-tureng'
Plug 'tpope/vim-commentary'
Plug 'ihsanturk/vim-emacs-like'
Plug 'terryma/vim-multiple-cursors'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Plugin: vim-gitgutter {{{1

Plug 'airblade/vim-gitgutter'

nn <leader>gd :GitGutterBufferToggle<cr>
se signcolumn=yes
highlight link GitGutterChangeLine DiffText
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_highlight_lines = 0
let g:gitgutter_async = 1

" }}}
" Plugin: vim-bufkill {{{1

Plug 'qpkorr/vim-bufkill'

" Close buffer but don't close window
cnorea bd BD
cnorea Bd BD
nm <M-k> :BD<cr>

" }}}
" Plugin: code-stats-vim {{{1

Plug 'https://gitlab.com/code-stats/code-stats-vim.git', { 'tag': 'v0.6.0' }

let g:codestats_api_key = $CODESTATS_API_KEY

" }}}
" Plugin: deoplete{-tabnine} {{{1

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

let g:deoplete#enable_at_startup = 1

" }}}
" Plugin: fzf.vim {{{1
" lets make some emacs noise

Plug 'junegunn/fzf.vim'

nm <M-f> :Files<CR>
nm <M-s> :BLines<CR>
nm <M-b> :Buffers<CR>
nm <M-r> :History<CR>
nm <M-x> :Commands<CR>
nm <M-h> :Helptags!<CR>
let g:fzf_commands_expect = 'alt-enter'
set rtp+=/usr/local/opt/fzf " If fzf installed using Homebrew

" }}}
" Plugin: goyo.vim {{{1

Plug 'junegunn/goyo.vim'

nm <M-g> :Goyo<CR>
let g:goyo_height = '100%'

" }}}
" Plugin: vim-easy-align {{{1

Plug 'junegunn/vim-easy-align'

xm ga <Plug>(LiveEasyAlign)
nm ga <Plug>(LiveEasyAlign)

" }}}
" Plugin: vim-searchhi {{{1

Plug 'qxxxb/vim-searchhi'

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

" }}}
" Plugin: vimwiki {{{1

Plug 'vimwiki/vimwiki'

let g:vimwiki_auto_chdir = 1
let g:vimwiki_list = [{'path': '~/Dropbox/Document/Wiki/',
	\ 'path_html': '~/Dropbox/Document/Blog/ihsanturk.dev/public/'}]
autocmd FileType vimwiki nm <leader>e :set cole=0<cr>
autocmd FileType vimwiki nm <leader>v :set cole=2<cr>

" }}}
" Plugin: gruvbox {{{1
" Appearance

Plug 'morhetz/gruvbox'

let g:gruvbox_italic = 1
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_contrast_light = 'medium'

" }}}

cal plug#end()

" FORSAKEN {{{1

" Plugin: vim-searchhi {{{2

" Plug 'qxxxb/vim-searchhi'

" nm # <Plug>(searchhi-#)
" nm * <Plug>(searchhi-*)
" nm N <Plug>(searchhi-N)
" nm n <Plug>(searchhi-n)
" nm g# <Plug>(searchhi-g#)
" nm g* <Plug>(searchhi-g*)
" nm gD <Plug>(searchhi-gD)
" nm gd <Plug>(searchhi-gd)
" vm # <Plug>(searchhi-v-#)
" vm * <Plug>(searchhi-v-*)
" vm N <Plug>(searchhi-v-N)
" vm n <Plug>(searchhi-v-n)
" vm g# <Plug>(searchhi-v-g#)
" vm g* <Plug>(searchhi-v-g*)
" vm gD <Plug>(searchhi-v-gD)
" vm gd <Plug>(searchhi-v-gd)
" nm <C-c> mx<Plug>(searchhi-clear-all)<cr>`x

" " }}}
" Plugin: vim-markdown {{{2

" Plug 'plasticboy/vim-markdown'
" 
" let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_auto_insert_bullets = 1

" }}}
" Plugin: animate.vim {{{2

" Plug 'camspiers/animate.vim'

" nn <silent> <Up>    :call animate#window_delta_height(-10)<CR>
" nn <silent> <Down>  :call animate#window_delta_height(10)<CR>
" nn <silent> <Left>  :call animate#window_delta_width(-10)<CR>
" nn <silent> <Right> :call animate#window_delta_width(10)<CR>

" let g:fzf_layout = {
" 			\ 'window': 'new | wincmd J | resize 1 | call animate#window_percent_height(0.3)'
" \ }

" }}}
" Section: vim-go {{{2
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } "Not using so much
" au FileType go nm <leader>g :GoDef<cr>
" au FileType go nm <leader>l :GoLint<cr>
" au FileType go nm <leader>t :GoTest<cr>
" au FileType go nm <leader>b :GoBuild<cr>
" au FileType go nm <leader>i :GoInstall<cr>

" }}}

" Plug 'yuttie/comfortable-motion.vim'
" Plug 'JamshedVesuna/vim-markdown-preview'
" Plug 'chriskempson/base16-vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'tpope/vim-obsession'
" Plug 'scrooloose/nerdtree'
" nm <M-3> :NERDTreeToggle<cr><C-w>=
" let NERDTreeMinimalView = 1
" let NERDTreeStatusline = ' NerdTree'
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
" Plug 'krisajenkins/vim-pipe'
" Plug 'neovim/nvim-lsp'

" }}}

" vim: set fdm=marker :
