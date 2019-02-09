set number
set nohlsearch
set incsearch
set tabstop=4
set viminfo=""
set smartindent
set shiftwidth=4
set ruler

syntax on
filetype plugin indent on
highlight LineNr ctermfg=grey ctermbg=black


"=== vim plug plugins ==="
call plug#begin('~/.vim/plugged')

Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'junegunn/goyo.vim'

call plug#end()

"live LaTeX preview
let g:livepreview_previewer = 'mupdf'
let g:livepreview_cursorhold_recompile = 0

"goyo
let g:goyo_linenr = 1

"=== color scheme ==="
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox


"=== default templates ==="
augroup templates
    autocmd!
    autocmd BufNewFile *.cpp 0r ~/.vim/templates/default.cpp
    autocmd BufNewFile *.c   0r ~/.vim/templates/default.c
augroup END



"=== SINPPETS ==="

"reload vimrc even when vim open
map <F5> :so ~/.vimrc<CR>
map <F2> :Goyo<Enter>
map <C-n> :let g:goyo_linenr=!g:goyo_linenr<Enter><F2><F2>

"comment out a line(s)
autocmd FileType py 	map	<C-u> <Esc>mx:s/^#//g<Esc>`x
autocmd FileType py 	map	<C-c> <Esc>mx0i#<Esc>`x
autocmd FileType c 		map	<C-u> <Esc>mx:s/^\/\///g<Esc>`x
autocmd FileType c 		map	<C-c> <Esc>mx0i//<Esc>`x
autocmd FileType vim	map	<C-u> <Esc>mx:s/^\"//g<Esc>`x
autocmd FileType vim	map	<C-c> <Esc>mx0i"<Esc>`x

"highlighting the search toggle
map <C-h> :set nohlsearch !<Enter>

"navigating with guides
inoremap 	<F3> <Esc>/<++><Enter>"_c4l
vnoremap 	<F3> <Esc>/<++><Enter>"_c4l
map 		<F3> <Esc>/<++><Enter>"_c4l


""" C
autocmd FileType c inoremap ,for for(<++>; <++>; <++>)<Enter>{<Enter><++><Enter>}
autocmd FileType c inoremap ,if if(<++>)<Enter>{<Enter><++><Enter>}
autocmd FileType c inoremap ,while while(<++>)<Enter>{<Enter><++><Enter>}
autocmd FileType c inoremap ,do do{<Enter><++><Enter>}while();<Esc>hi
