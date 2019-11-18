" vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

""python3 install.py --all or --python
"Plug 'ycm-core/YouCompleteMe'

Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-startify'
Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf.vim'
"Plug 'scrooloose/syntastic'

call plug#end()
