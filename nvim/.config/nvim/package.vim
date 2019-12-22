" vim-plug for neovim
" if empty(glob('~/.config/nvim/autoload/plug.vim'))
  " silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    " \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif


call plug#begin()

Plug 'junegunn/vim-easy-align'
Plug 'chriskempson/base16-vim'
Plug 'markonm/traces.vim'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.config/nvim/package/fzf.vim', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" FORSAKEN
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'tpope/vim-obsession'
