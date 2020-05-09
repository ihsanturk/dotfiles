" =============================================================================
" File:        nvimrc
" Description: neovim configuration
" Author:      ihsan <ihsanl at pm dot me>
" Updated At:  1588183108
" License:     MIT License
" =============================================================================

" plugins {{{1

cal plug#begin()

Plug 'mhinz/vim-rfc'
Plug 'keith/swift.vim'
Plug 'sirver/ultisnips'
Plug 'godlygeek/tabular'
Plug 'mkitt/tabline.vim'
Plug 'dense-analysis/ale'
Plug 'etdev/vim-hexcolor'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-obsession'
Plug 'chrisbra/unicode.vim'
Plug 'ihsanturk/vim-tureng'
Plug 'tpope/vim-commentary'
Plug 'liuchengxu/graphviz.vim'
Plug 'ihsanturk/vim-emacs-like'
Plug 'jbmorgado/vim-pine-script'
Plug 'neovimhaskell/haskell-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'benjamineskola/vim-applescript'
Plug 'https://gitlab.com/dbeniamine/todo.txt-vim.git'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Plugin: rust-doc.vim {{{2

Plug 'rhysd/rust-doc.vim'

let g:rust_doc#define_map_K = 0
aug vimrc-rust
	au!
	au FileType rust nn <buffer><silent>K :<c-u>DeniteCursorWord rust/doc<cr>
aug END

" }}}
" Plugin: vim-gitgutter {{{2

Plug 'airblade/vim-gitgutter'

se scl=yes
let g:gitgutter_async = 1
let g:gitgutter_highlight_lines = 0
let g:gitgutter_override_sign_column_highlight = 1
highlight link GitGutterChangeLine DiffText

" }}}
" Plugin: vim-bufkill {{{2

Plug 'qpkorr/vim-bufkill'

" Close buffer but don't close window
cnorea bd BD
cnorea Bd BD
nm <m-k> :BD<cr>

" }}}
" Plugin: code-stats-vim {{{2

Plug 'https://gitlab.com/code-stats/code-stats-vim.git'
", { 'tag': 'v0.6.0' }

let g:codestats_api_key = $CODESTATS_API_KEY

" }}}
" Plugin: deoplete{-tabnine} {{{2

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

let g:deoplete#enable_at_startup = 1

" }}}
" Plugin: fzf.vim {{{2
" lets make some emacs noise

Plug 'junegunn/fzf.vim'

nm <m-f> :Files<cr>
nm <m-s> :BLines<cr>
nm <m-r> :History<cr>
nm <m-b> :Buffers<cr>
nm <m-x> :Commands<cr>
nm <m-h> :Helptags!<cr>
tma <m-r> <c-\><c-n>:History<cr>
let g:fzf_commands_expect = 'alt-enter'
set rtp+=/usr/local/opt/fzf " If fzf installed using Homebrew

" }}}
" Plugin: goyo.vim {{{2

Plug 'junegunn/goyo.vim'

nm <m-g> :Goyo<cr>
let g:goyo_height = '100%'

" }}}
" Plugin: vim-easy-align {{{2

Plug 'junegunn/vim-easy-align'

xm ga <Plug>(LiveEasyAlign)
nm ga <Plug>(LiveEasyAlign)

" }}}
" Plugin: vimwiki {{{2

Plug 'vimwiki/vimwiki'

let g:vimwiki_auto_chdir = 1
let g:vimwiki_list = [{'path': '~/Dropbox/Document/Wiki/',
	\ 'path_html': '~/Dropbox/Document/Blog/ihsanturk.dev/public/'}]
autocmd FileType vimwiki nm <leader>e :set cole=0<cr>
autocmd FileType vimwiki nm <leader>v :set cole=2<cr>

" }}}
" Plugin: gruvbox {{{2
" Appearance

Plug 'morhetz/gruvbox'

let g:gruvbox_italic = 1
let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark = 'medium'

" }}}

cal plug#end()

" }}}
" mappings {{{1

nm j gj
nm k gk
nm * *<c-o>
nn <m-d> 0D
nn <space> za
vn <space> za
nn <c-h> 2zh2h
nn <c-l> 2zl2l
nm <m-o> <c-w>w
nn <c-space> zM
nm <m-n> :bn<cr>
nm <m-p> :bp<cr>
nn <m-n> :bn<cr>
nm <m-S-o> <c-w>p
nn <c-c> :noh<cr>
nn <m-space> zMzo
nn <m-c> :make<cr>
nn <leader>z zMzvzz
im <m-o> <esc><c-w>w
nn gf :e <cfile><cr>
tno <Esc> <c-\><c-n>
nm <m-1> :set cuc!<cr>
tma <m-o> <c-\><c-n><c-w>w
nn <leader>e :se cole=0<cr>
nn <leader>v :se cole=3<cr>
vn gs :!sortlength<cr><c-l>
tma <m-S-o> <c-\><c-n><c-w>p
nn gsr mx:'{+1,'}-1!sort -R<cr>`x
nn gsl mx:'{+1,'}-1!sortlength<cr>`x
nm <leader>r :so ~/.config/nvim/init.vim<cr>:noh<cr>
nm <leader>i :so ~/.config/nvim/init.vim<cr>:PlugInstall<cr>
nn <leader>c :topleft 44vs :enew \|:setl nornu nonu<cr><c-w>w
nm <m-t> :let $DIR=expand('%:p:h')<cr>:ter<cr>cd $DIR;tput clear<cr>
nn <leader>d :exe 'norm! a'.system("date '+%Y %b %d %X'\|tr -d '\n'")<cr><cr>

" Section: Help {{{2

au FileType help nn <buffer> <m-k> :q<cr>

" }}}
" Section: RFC Docs {{{2

au Filetype rfc nn <buffer> <space> :;//norm! zt<cr>
au Filetype rfc nn <buffer> <c-space> :;?/norm! zt<cr>

" }}}"
" Section: Navigation {{{2
" Section: Tab navigation {{{3

nn `` `
nn `1 1gt
nn `2 2gt
nn `3 3gt
nn `4 4gt
nn `5 5gt
nn `6 6gt
nn `7 7gt
nn `8 8gt
nn `9 9gt
nn `c :tabe +ter<cr>
nn `n gt
nn `p gT
tno `` `
tno `1 1gt
tno `2 2gt
tno `3 3gt
tno `4 4gt
tno `5 5gt
tno `6 6gt
tno `7 7gt
tno `8 8gt
tno `9 9gt
tno `c :tabe +ter<cr>
tno `n gt
tno `p gT
tma `` `
tma `1 <c-\><c-n>1gt
tma `2 <c-\><c-n>2gt
tma `3 <c-\><c-n>3gt
tma `4 <c-\><c-n>4gt
tma `5 <c-\><c-n>5gt
tma `6 <c-\><c-n>6gt
tma `7 <c-\><c-n>7gt
tma `8 <c-\><c-n>8gt
tma `9 <c-\><c-n>9gt
tma `c <c-\><c-n>:tabe +ter<cr>
tma `n <c-\><c-n>gt
tma `p <c-\><c-n>gT

" }}}
" Section: Pane/window navigation {{{3

nn `h <c-w>h
nn `j <c-w>j
nn `k <c-w>k
nn `l <c-w>l
tma `h <c-\><c-n><c-w>h
tma `j <c-\><c-n><c-w>j
tma `k <c-\><c-n><c-w>k
tma `l <c-\><c-n><c-w>l

nn `b :sp +ter<cr>
nn `v :vs +ter<cr>
tma `b <c-\><c-n>:sp +ter<cr>
tma `v <c-\><c-n>:vs +ter<cr>

" }}}
" }}}
" Section: Scroll with pivot {{{2

nm <c-j> <c-e>j
nm <c-k> <c-y>k

" }}}
" Section: Auto Highlight {{{2

nm <leader>/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<cr>
func! AutoHighlightToggle()
	if exists('#auto_highlight')
		au! auto_highlight
		aug! auto_highlight
		setl updatetime=20
		echo 'Highlight current word: off'
		return 0
	el
		aug auto_highlight
			au!
			au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
		aug end
		setl updatetime=20
		echo 'Highlight current word: ON'
		retu 1
	endif
endf

" }}}
" Section: Easier text-objects on numbers {{{2

vn i9  i(
vn i0  i)
vn a9  a(
vn a0  a)
nn ci9 ci(
nn ci0 ci)
nn ca9 ca(
nn ca0 ca)
nn di9 di(
nn di0 di)
nn da9 da(
nn da0 da)

" }}}
" Section: Ex/Mommand Mode {{{2

cnorea Q   q
cnorea H   h
cnorea W   w
cnorea E   e
cnorea Q!  q!
cnorea Qa  qa
cnorea qw  wq
cnorea Wq  wq
cnorea wQ  wq
cnorea WQ  wq
cnorea man Man
cnorea cdc cd %:p:h<cr>:

" }}}
" Section: FoxDot {{{2

" Open a terminal buffer and run foxdot command with pipe option

au FileType python nm <buffer> <return> mxyap<c-w>wpi<cr><esc><c-w>w`x
au FileType python vn <buffer> <return> y<c-w>wpi<cr><esc><c-w>w

" }}}

" }}}
" settings {{{1

" To see what is the option doing press:
"    'K (Shift-k) on that word' or ':h ic'

se ic
se nu
se sb
se awa
se bri
se lbr
se rnu
se scs
se spr
se tgc
se wic
se list
se ls=2
se noea
se noru
se so=1
se wmnu
se wrap
se nocul
se nosmd
se noswf
se cole=2
se ttm=10
syntax on
se cocu=nc
se mouse=a
se sbr=↪
se sd='1000
se mmp=20000
se fdm=marker
se icm=nosplit
setg fenc=utf-8
se bs=indent,eol,start
se noet ts=3 sts=3 sw=3
se sh=/usr/local/bin/zsh
filetype plugin indent on
let did_install_syntax_menu = 1
au FileType vimwiki,vim se tw=79
let did_install_default_menus = 1
au FileType rust,python se noet ts=3 sts=3 sw=3
se lcs=tab:⁝\ ,eol:\ ,extends:❯,precedes:❮
au FileType sql se mp=cat\ %\ \\\|\ mysql\ -uroot

" Section: Shell Mode {{{2

au FileType sh,zsh setl com-=n:#
au FileType sh,zsh setl fo-=o

" }}}
" Section: Markdown Mode {{{2

au FileType markdown setl com-=n:#
au FileType markdown setl com-=fb:-
au FileType markdown setl com+=n:- " Auto append - in new line.
au FileType markdown setl fo+=ro
au FileType markdown setl tw=79

" }}}
" Section: Make dir if not exists {{{2

augroup Mkdir
  autocmd!
  autocmd BufWritePre *
    \ if !isdirectory(expand("<afile>:p:h")) |
        \ call mkdir(expand("<afile>:p:h"), "p") |
    \ endif
augroup END

" }}}
" Section: SQL Query {{{2

au BufWritePost ~/.query.sql 
			\ :silent!cat ~/.query.sql|mysql -turoot > ~/.query_result.txt

" }}}
" Section: Terminal Buffer Improvements {{{2

aug custom_term
	au!
	au BufEnter,TermOpen term://* start
	au TermEnter * setl nonu nornu nomod
	au TermClose * :bd!
aug END

fun! TermTest(cmd)
	cal termopen(a:cmd, {'on_exit': 's:OnExit'})
endf
fun! s:OnExit(job_id, code, event) dict
	if a:code == 0
		clo
	end
endf

" }}}
" Section: Variables {{{2

let mapleader = '\'
let g:netrw_liststyle=3
let g:is_posix = 1 "shell
let g:netrw_dirhistmax = 0

" }}}
" Section: Set scripts to be executable from the shell {{{2

if getline(1) =~ "^#!.*/bin/"
	call system('chmod +x ' . shellescape(expand("%:p")))
endif

" }}}
" Section: Assumes set ignorecase smartcase {{{2

aug dynamic_smartcase
	au!
	au CmdLineEnter : se nosmartcase
	au CmdLineLeave : se smartcase
aug END

" }}}
" Section: Jump/remember to the last position {{{2

au BufReadPost * if line("'\"") > 1 && 
			\ line("'\"") <= line("$") | exe "normal! g'\"zz" | end

" }}}
" Section: 80 column rule {{{2

if exists('+colorcolumn')
	se cc=80
else
	au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
end

" }}}
" Section: Persistent undo {{{2

if has('persistent_undo')
	se udf
	se udir=~/.cache/vim
end
if has('unnamedplus')
	se cb=unnamed,unnamedplus
end
scripte utf-8

" }}}
" Section: Appearance {{{2

se bg=dark
color gruvbox
hi ErrorMsg ctermfg=Red ctermbg=237
hi Visual gui=none cterm=none

" Statusline {{{3
hi User1 ctermfg=11 ctermbg=237 cterm=none guifg=#FABD2F guibg=#3A3A3A gui=none
hi User2 ctermfg=3  ctermbg=238 cterm=none guifg=#D49721 guibg=#444444 gui=none
hi User3 ctermfg=9  ctermbg=236 cterm=bold guifg=#F84833 guibg=#303030 gui=none
hi User4 ctermfg=6  ctermbg=237 cterm=bold guifg=#689D6A guibg=#3A3A3A gui=bold
hi User5 ctermfg=7  ctermbg=239 cterm=none guifg=#A89984 guibg=#4E4E4E gui=none
hi User6 ctermfg=11 ctermbg=237 cterm=none guifg=#FABD2F guibg=#3A3A3A gui=bold

func TotalBufferNumber()
	return len(getbufinfo({'buflisted':1}))
endfunc

set statusline=
set statusline+=%1*\ %{TotalBufferNumber()}b "1 BufferNumber
set statusline+=\ %0*\ %f "0 FilePath
set statusline+=\ %3*%m%r%w%0*%= "3 ReadOnly?
set statusline+=\ %4*\ %y "4 FileType
set statusline+=\ %6*%{strftime('%-d\ %b\ %-H:%M')}\  "6 Time
hi StatusLine gui=bold guifg=#689D6A guibg=#303030 ctermfg=14 ctermbg=234 cterm=bold
hi StatusLineNC gui=none guifg=#585858 guibg=#303030 ctermfg=240 ctermbg=236
hi StatusLineTerm ctermfg=233 ctermbg=14
hi StatusLineTermNC ctermfg=240 ctermbg=236 term=none  

" }}}

"}}}

" }}}
" snippets {{{1

" Section: Expand quotes/parantheses automatically {{{2

ino <expr> ` getline(".")[col(".")-1]=="`" ? "`" : "``<Left>"
au FileType html,markdown ino < <><Left>
ino { {}<Left>
ino ( ()<Left>
ino [ []<Left>

" Section: Do not expand if already did {{{3

ino <expr> <cr> getline(".")[col(".")-2:col(".")-1]=="{}" ?
			\ "<cr><esc>O" : "<cr>"
ino <expr> } getline(".")[col(".")-2:col(".")-1]=="{}" ? "<Right>" : "}" 
ino <expr> > getline(".")[col(".")-2:col(".")-1]=="<>" ? "<Right>" : ">" 
ino <expr> ) getline(".")[col(".")-2:col(".")-1]=="()" ? "<Right>" : ")" 
ino <expr> ] getline(".")[col(".")-2:col(".")-1]=="[]" ? "<Right>" : "]" 

" }}}
" }}}
" Section: Smart Space Key {{{2

func! SmartSpace()
	let l:aroundchars = getline(".")[col(".")-2:col(".")-1]
	if (l:aroundchars=='""') ||
	 \ (l:aroundchars=="''") ||
	 \ (l:aroundchars=="``") ||
	 \ (l:aroundchars=="<>")
		return "\<Right>\<Backspace>\<Space>" 
	elseif (l:aroundchars=='[]') ||
		  \ (l:aroundchars=="{}") ||
		  \ (l:aroundchars=="()")
		return "\<Space>\<Left>\<Space>" 
	end
	return "\<Space>" 
endf
ino <Space> <C-R>=SmartSpace()<cr>

" }}}
" Section: Smart Backspace Key {{{2

func! SmartBackspace()
	let l:aroundchars = getline(".")[col(".")-2:col(".")-1]
	if (l:aroundchars=='""') ||
	 \ (l:aroundchars=="''") ||
	 \ (l:aroundchars=="``") ||
	 \ (l:aroundchars=="{}") ||
	 \ (l:aroundchars=="<>") ||
	 \ (l:aroundchars=="()") ||
	 \ (l:aroundchars=="[]")
		return "\<Right>\<Backspace>\<Backspace>" 
	else
		return "\<Backspace>" 
endfunc
ino <Backspace> <C-R>=SmartBackspace()<cr>

" }}}

" }}}

" F O R S A K E N {{{1

" " Plugin: denite.nvim {{{2

" if has('nvim')
" 	Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
" else
" 	Plug 'Shougo/denite.nvim'
" 	Plug 'roxma/nvim-yarp'
" 	Plug 'roxma/vim-hug-neovim-rpc'
" endif

" " Define mappings
" au FileType denite call s:denite_my_settings()
" func! s:denite_my_settings() abort
" 	nn <silent><buffer><expr> <cr>
" 	\ denite#do_map('do_action')
" 	nn <silent><buffer><expr> d
" 	\ denite#do_map('do_action', 'delete')
" 	nn <silent><buffer><expr> p
" 	\ denite#do_map('do_action', 'preview')
" 	nn <silent><buffer><expr> q
" 	\ denite#do_map('quit')
" 	nn <silent><buffer><expr> i
" 	\ denite#do_map('open_filter_buffer')
" 	nn <silent><buffer><expr> <Space>
" 	\ denite#do_map('toggle_select').'j'
" endfunction

" nm <m-b> :Denite buffer<cr>

" " }}}

" }}}

" vim: set fdm=marker :
