set number
set hlsearch
set incsearch
set tabstop=4
set expandtab
set shiftwidth=4
set viminfo=""
set smartindent
set ruler
set clipboard=unnamed
set cursorline
set laststatus=2
set statusline=%f\ %y\ %m%=%P


syntax on
filetype plugin indent on
highlight LineNr ctermfg=grey ctermbg=black


"=== vim plug plugins ==="
call plug#begin('~/.vim/plugged')

Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'


call plug#end()

"live LaTeX preview
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0

"goyo
let g:goyo_linenr = 1
let g:goyo_width = 80

"nerdtree
map <F3> :NERDTreeToggle<CR>

"FZF
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '~20%' }


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
map <F5> <Esc>:so ~/.vimrc<CR>
map <S-Tab> <Esc>d4hi
map <F2> :Goyo<CR>
map <C-n> :let g:goyo_linenr=!g:goyo_linenr<CR><F2><F2>:set number!<CR>
map :W :w
map q: :q
map :F :FZF<Enter>

"comment out a line
autocmd FileType c map <C-u> <Esc>mx:s/^\/\///g<Esc>`x
autocmd FileType c map <C-c> <Esc>mx0i//<Esc>`x
autocmd FileType cpp map <C-u> <Esc>mx:s/^\/\///g<Esc>`x
autocmd FileType cpp map <C-c> <Esc>mx0i//<Esc>`x
autocmd FileType sh map <C-u> <Esc>mx:s/^#//g<Esc>`x
autocmd FileType sh map	<C-c> <Esc>mx0i#<Esc>`x
autocmd FileType bash map <C-u> <Esc>mx:s/^#//g<Esc>`x
autocmd FileType bash map <C-c> <Esc>mx0i#<Esc>`x
autocmd FileType python map <C-u> <Esc>mx:s/^#//g<Esc>`x
autocmd FileType python map	<C-c> <Esc>mx0i#<Esc>`x
autocmd FileType vim map <C-u> <Esc>mx:s/^\"//g<Esc>`x
autocmd FileType vim map <C-c> <Esc>mx0i"<Esc>`x
autocmd FileType vimrc map <C-u> <Esc>mx:s/^\"//g<Esc>`x
autocmd FileType vimrc map <C-c> <Esc>mx0i"<Esc>`x

"put/take quote marks around current word
map <C-a> <Esc>mxciw'<Esc>pa'<Esc>`xl
map <C-x> <Esc>mxvi'vlxF'x<Esc>`xh

"highlighting the search toggle
map <C-h> :set nohlsearch !<Enter>

"navigating with guides
inoremap 	<F4> <Esc>/<++><Enter>"_c4l
vnoremap 	<F4> <Esc>/<++><Enter>"_c4l
map 		<F4> <Esc>/<++><Enter>"_c4l


""" C
autocmd FileType c inoremap ,for for(<++>; <++>; <++>)<Enter>{<Enter><++><Enter>}
autocmd FileType c inoremap ,if if(<++>)<Enter>{<Enter><++><Enter>}
autocmd FileType c inoremap ,while while(<++>)<Enter>{<Enter><++><Enter>}
autocmd FileType c inoremap ,do do{<Enter><++><Enter>}while();<Esc>hi
""" C++
autocmd FileType cpp inoremap ,for for(<++>; <++>; <++>)<Enter>{<Enter><++><Enter>}
autocmd FileType cpp inoremap ,if if(<++>)<Enter>{<Enter><++><Enter>}
autocmd FileType cpp inoremap ,while while(<++>)<Enter>{<Enter><++><Enter>}
autocmd FileType cpp inoremap ,do do{<Enter><++><Enter>}while();<Esc>hi
""" Python
autocmd FileType python inoremap ,ifname if __name__ == '__main__':<Enter>
