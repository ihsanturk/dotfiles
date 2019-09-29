" vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()

Plug 'mhinz/vim-startify'
Plug 'scrooloose/syntastic'
Plug 'morhetz/gruvbox'

Plug 'junegunn/fzf.vim'
source /usr/share/doc/fzf/examples/fzf.vim

call plug#end()
