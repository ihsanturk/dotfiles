set number
set hlsearch
set incsearch
set tabstop=4
set expandtab
set shiftwidth=4
set viminfo=""
set smartindent
set ruler
set cursorline
set laststatus=2
set statusline=%f\ %y\ %m%=%P
set noswapfile
set nobackup
set ttyfast
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

syntax on
filetype plugin indent on
highlight LineNr ctermfg=grey ctermbg=black


"=== vim plug plugins ==="
call plug#begin('~/.vim/plugged')

Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'jistr/vim-nerdtree-tabs'


call plug#end()

"live LaTeX preview
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0

"goyo
let g:goyo_linenr = 1
let g:goyo_width = 80

"nerdtree
map <F3> :NERDTreeTabsToggle<CR>
let NERDTreeMapActivateNode='<space>'


"FZF
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '~20%' }


"=== color scheme ==="
set background=dark

if  &background == 'dark'
    hi CursorLine ctermbg=15
endif

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox


"=== cursor type ==="
let &t_SI="\e[6 q"
let &t_EI="\e[2 q"

"=== default templates ==="
augroup templates
    autocmd!
    autocmd BufNewFile *.cpp 0r ~/.vim/templates/default.cpp
    autocmd BufNewFile *.c   0r ~/.vim/templates/default.c
augroup END

"=== remember cursor position ==="
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"=== SINPPETS ==="
set timeout           " for mappings
set timeoutlen=1000   " default value
set ttimeout          " for key codes
set ttimeoutlen=10    " unnoticeable small value

nmap <Tab> <Esc>:tabnext<CR>
nmap <S-Tab> <Esc>:tabprevious<CR>
nmap <F5> <Esc>:so ~/.vimrc<CR>
map <F2> :Goyo<CR>
map <C-n> :let g:goyo_linenr=!g:goyo_linenr<CR><F2><F2>:set number!<CR>
cnoreabbrev W w<CR>
cnoreabbrev Wq wq<CR>
cnoreabbrev qw wq<CR>
cnoreabbrev Q! q!<CR>
cnoreabbrev Q q<CR>
cnoreabbrev q: q<CR>
cmap F FZF<Enter><CR>

"comment out a line
autocmd FileType c,cpp map <C-u> <Esc>mx:s/^\/\///g<Esc>`x
autocmd FileType c,cpp map <C-c> <Esc>mx0i//<Esc>`x
autocmd FileType python,readline,sh map <C-u> <Esc>mx:s/^#//g<Esc>`x
autocmd FileType python,readline,sh map	<C-c> <Esc>mx0i#<Esc>`x
autocmd FileType css map <C-u> <Esc>mx:s/^\/\*//g<Esc>`x
autocmd FileType css map <C-c> <Esc>mx0i/*<Esc>`x
autocmd FileType vim map <C-u> <Esc>mx:s/^\"//g<Esc>`x
autocmd FileType vim map <C-c> <Esc>mx0i"<Esc>`x
autocmd FileType xdefaults map <C-u> <Esc>mx:s/^\!//g<Esc>`x
autocmd FileType xdefaults map <C-c> <Esc>mx0i! <Esc>`x

"put/take quote marks around the current word
map <C-a> <Esc>mxciw'<Esc>pa'<Esc>`xl
map <C-x> <Esc>mxvi'vlxF'x<Esc>`xh

"highlighting the search toggle
map <C-h> :set nohlsearch !<Enter>

"navigating with guides
imap  <F4> <Esc>/<++><Enter>"_c4l
vmap  <F4> <Esc>/<++><Enter>"_c4l
map   <F4> <Esc>/<++><Enter>"_c4l


""" C,CPP
autocmd FileType c,cpp imap ,for for(<++>; <++>; <++>)<Enter>{<Enter><++><Enter>}
autocmd FileType c,cpp imap ,if if(<++>)<Enter>{<Enter><++><Enter>}
autocmd FileType c,cpp imap ,while while(<++>)<Enter>{<Enter><++><Enter>}
autocmd FileType c,cpp imap ,do do{<Enter><++><Enter>}while();<Esc>hi
""" Python
autocmd FileType python imap ,ifname if __name__ == '__main__':<Enter>
