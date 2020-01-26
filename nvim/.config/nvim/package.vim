call plug#begin()

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'qxxxb/vim-searchhi'
Plug 'makerj/vim-pdf'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'itchyny/calendar.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'vimwiki/vimwiki'
Plug 'markonm/traces.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dbeniamine/cheat.sh-vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf.vim'

call plug#end()

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

" Goyo :q not quits at all.
function! s:goyo_enter()
	let b:quitting = 0
	let b:quitting_bang = 0
	autocmd QuitPre <buffer> let b:quitting = 1
	cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
	" Quit Vim if this is the only remaining buffer
	if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
		if b:quitting_bang
			qa!
		else
			qa
		endif
	endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" FORSAKEN
" Plug 'JamshedVesuna/vim-markdown-preview'
" Plug 'chriskempson/base16-vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'tpope/vim-obsession'
" Plug 'scrooloose/nerdtree'
" nmap <M-3> :NERDTreeToggle<cr><C-w>=
