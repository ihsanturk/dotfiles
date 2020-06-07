" =============================================================================
" File:        nvimrc
" Description: neovim configuration
" Author:      ihsan <ihsanl at pm dot me>
" Updated At:  1588183108
" License:     MIT License
" =============================================================================

let OPEN_COMMAND = "open"

" plugins {{{1

" Auto install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif
let g:plug_window = 'enew'

cal plug#begin('~/.config/nvim/plugged')

Plug 'cespare/vim-toml'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-abolish'
Plug 'dense-analysis/ale'
Plug 'etdev/vim-hexcolor'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'ihsanturk/vim-tureng'
Plug 'tpope/vim-commentary'
Plug 'plasticboy/vim-markdown'
Plug 'ihsanturk/vim-emacs-like'
Plug 'benjamineskola/vim-applescript'
Plug 'mhinz/vim-rfc', { 'on': 'RFC' }
if has('nvim') | Plug 'sirver/ultisnips' | end
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'https://gitlab.com/dbeniamine/todo.txt-vim.git'

" Plugin vim-fugitive {{{2

Plug 'tpope/vim-fugitive'

command! -bang -nargs=* Gcommit Git<bang> commit <args> | only

" }}}
" Plugin markdown-preview.nvim {{{2

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

let g:mkdp_auto_close = 0
let g:vim_markdown_folding_disabled = 1

" }}}
" Netrw {{{2

let g:netrw_banner = 0
let g:netrw_winsize = 20
nm <m-2> :Lexplore<cr>

" }}}
" Plugin: vim-wheel {{{2
Plug 'reedes/vim-wheel'

let g:wheel#map#up   = '<c-k>'
let g:wheel#map#down = '<c-j>'

" }}}
" Plugin: neuron.vim {{{2

let g:zkdir = $HOME.'/Dropbox/zettelkasten/'
let g:style_virtual_title = 'Comment'
let g:replace_links_with_virtual_title = 1
let g:hide_links = 1

Plug 'ihsanturk/neuron.vim'

" }}}
" Plugin: vim-ledger {{{2

Plug 'ledger/vim-ledger'

let g:ledger_maxwidth = 80

aug ledgerf
	au!
	au FileType ledger	nm <LocalLeader>a :LedgerAlign<cr>
	au FileType ledger	setl ts=8 noet
aug END

" }}}
" Plugin: haskell.vim {{{2

Plug 'neovimhaskell/haskell-vim'

au FileType haskell setl et

" }}}
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
nm <m-k> :BD<cr>

" }}}
" Plugin: code-stats-vim {{{2

Plug 'https://gitlab.com/code-stats/code-stats-vim.git'
", { 'tag': 'v0.6.0' }

let g:codestats_api_key = $CODESTATS_API_KEY

" }}}
" Plugin: deoplete{,-tabnine} {{{2

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

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
" Plugin: gruvbox {{{2
" Appearance

Plug 'morhetz/gruvbox'

let g:gruvbox_italic = 1
let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark = 'medium'

" }}}

" Not Often Plugins {{{2
"
" Plug 'chrisbra/unicode.vim'
" Plug 'jbmorgado/vim-pine-script'
" Plug 'jparise/vim-graphql'
" Plug 'keith/swift.vim'
" Plug 'lingceng/z.vim'
" Plug 'liuchengxu/graphviz.vim'
" Plug 'simnalamburt/vim-mundo'
" Plug 'tpope/vim-obsession'
"
" }}}

cal plug#end()

" }}}
" mappings {{{1

nm j gj
nm k gk
nm * *<c-o>
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
vn <leader>g :!gt<cr>
nm <leader>g :.!gt<cr>
nm <m-.> :cd %:p:h<cr>
nm <m-1> :set cuc!<cr>
tma <m-o> <c-\><c-n><c-w>w
nn <leader>e :se cole=0<cr>
nn <leader>v :se cole=3<cr>
vn gs :!sortlength<cr><c-l>
tma <m-S-o> <c-\><c-n><c-w>p
vn <leader>s :!sozlukgovtr<cr>
nm <LocalLeader>% :source %<cr>
nn gsr mx:'{+1,'}-1!sort -R<cr>`x
nn <leader>c :exec "e " . MYVIMRC<cr>
nn gsl mx:'{+1,'}-1!sortlength<cr>`x
nn <leader>C :exec "tabe " . MYVIMRC<cr>
vn // y/\V<C-R>=escape(@",'/\')<CR><CR>
vn <leader>w :!xargs wikipedia 2>/dev/null<cr>
nm <leader>o :silent exe '!'.OPEN_COMMAND.' .'<cr>
nm <leader>r :so ~/.config/nvim/init.vim<cr>:noh<cr>
nm <leader>w :exe '!wikipedia '.expand('<cword>')<cr>
nn <leader>s :exe '!sozlukgovtr '.expand('<cword>')<cr>
nm <leader>i :so ~/.config/nvim/init.vim<cr>:PlugInstall<cr>
nm <m-t> :let $DIR=expand('%:p:h')<cr>:ter<cr>cd $DIR;tput clear<cr>
nn <leader>d :exe 'norm! a'.system("date '+%Y %b %d %X'\|tr -d '\n'")<cr><cr>

" Create empty buffer for center purpose {{{2
" FIXME: After toggleing a few times, function is not working properly.
func CenterHelperToggle()
	if bufexists(":e /private/tmp/center_helper")
		:bd! ":e /private/tmp/center_helper"
	else
		:topleft 44vs :e /private/tmp/center_helper
	en
endf

" |:setl nornu nonu
nn <leader>l :call CenterHelperToggle()<cr>

" }}}
" Help {{{2

au FileType help nn <buffer> <m-k> :q<cr>

" }}}
" RFC Docs {{{2

au Filetype rfc nn <buffer> <space> :;//norm! zt<cr>
au Filetype rfc nn <buffer> <c-space> :;?/norm! zt<cr>

" }}}"
" Navigation {{{2

" Buffer navigation {{{3

nn  `` `
tno `` `
tma `` `
nn  `1 :1b<cr>
nn  `2 :2b<cr>
nn  `3 :3b<cr>
nn  `4 :4b<cr>
nn  `5 :5b<cr>
nn  `6 :6b<cr>
nn  `7 :7b<cr>
nn  `8 :8b<cr>
nn  `9 :9b<cr>
nn  `n :bp<cr>
nn  `p :bn<cr>
tno `1 :1b<cr>
tno `2 :2b<cr>
tno `3 :3b<cr>
tno `4 :4b<cr>
tno `5 :5b<cr>
tno `6 :6b<cr>
tno `7 :7b<cr>
tno `8 :8b<cr>
tno `9 :9b<cr>
tma `1 <c-\><c-n>:1b<cr>
tma `2 <c-\><c-n>:2b<cr>
tma `3 <c-\><c-n>:3b<cr>
tma `4 <c-\><c-n>:4b<cr>
tma `5 <c-\><c-n>:5b<cr>
tma `6 <c-\><c-n>:6b<cr>
tma `7 <c-\><c-n>:7b<cr>
tma `8 <c-\><c-n>:8b<cr>
tma `9 <c-\><c-n>:9b<cr>
nn  `c :bo 13sp +ter<cr>
tno `c :bo 13sp +ter<cr>
tma `c <c-\><c-n>:bo 13sp +ter<cr>
nn <Tab> :bn<cr>
tno `n :bn<cr>
tma `n <c-\><c-n>:bn<cr>
nn <S-Tab> :bp<cr>
tno <S-Tab> :bp<cr>
tma <S-Tab> <c-\><c-n>:bp<cr>

" }}}
" Pane/window navigation {{{3

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
" Auto Highlight {{{2

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
" Easier text-objects on numbers {{{2

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
" Ex/Mommand Mode {{{2

cnorea Q   q
cnorea H   h
cnorea W   w
cnorea Q!  q!
cnorea Qa  qa
cnorea qw  wq
cnorea Wq  wq
cnorea wQ  wq
cnorea WQ  wq
cnorea man Man
cnorea cdc cd %:p:h<cr>:

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
se nocul
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
se nosmd
se noswf
se sbr=↪
se cole=2
se ttm=10
syntax on
se cocu=nc
se mouse=a
se mmp=20000
se fdm=marker
setg fenc=utf-8
call Set80ColRule()
se bs=indent,eol,start
se sh=/usr/local/bin/zsh
filetype plugin indent on
se noet ci pi sts=0 sw=3 ts=3 
let did_install_syntax_menu = 1
au FileType vimwiki,vim se tw=79
let did_install_default_menus = 1
se lcs=tab:⁝\ ,eol:\ ,extends:❯,precedes:❮
au FileType rust,python se noet ts=3 sts=3 sw=3
if has('nvim') | se icm=nosplit sd='1000 | endif
au FileType sql se mp=cat\ %\ \\\|\ mysql\ -uroot

" Shell Mode {{{2

au FileType sh,zsh setl com-=n:#
au FileType sh,zsh setl fo-=o

" }}}
" Markdown Mode {{{2

" au FileType markdown setl spell
au FileType markdown setl com-=n:#
au FileType markdown setl com-=fb:-
au FileType markdown setl com+=n:- " Auto append - in new line.
au FileType markdown setl fo+=ro
au FileType markdown setl tw=79

" }}}
" Make dir if not exists {{{2

augroup Mkdir
  autocmd!
  autocmd BufWritePre *
    \ if !isdirectory(expand("<afile>:p:h")) |
        \ call mkdir(expand("<afile>:p:h"), "p") |
    \ endif
augroup END

" }}}
" SQL Query {{{2

au BufWritePost ~/.query.sql 
			\ :silent!cat ~/.query.sql|mysql -turoot > ~/.query_result.txt

" }}}
" Terminal Buffer Improvements {{{2

if has('nvim')
	aug custom_term
		au!
		au BufEnter,TermOpen term://* start
		au TermEnter * setl nonu nornu nomod
		au TermClose * :bd!
	aug END
endif

fun! TermTest(cmd)
	cal termopen(a:cmd, {'on_exit': 's:OnExit'})
endf
fun! s:OnExit(job_id, code, event) dict
	if a:code == 0
		clo
	end
endf

" }}}
" Variables {{{2

let mapleader = '\'
let g:netrw_liststyle=3
let g:is_posix = 1 "shell
let g:netrw_dirhistmax = 0

" }}}
" Set scripts to be executable from the shell {{{2

if getline(1) =~ "^#!.*/bin/"
	call system('chmod +x ' . shellescape(expand("%:p")))
endif

" }}}
" Assumes set ignorecase smartcase {{{2

aug dynamic_smartcase
	au!
	au CmdLineEnter : se nosmartcase
	au CmdLineLeave : se smartcase
aug END

" }}}
" Jump/remember to the last position {{{2

au BufReadPost * if line("'\"") > 1 && 
			\ line("'\"") <= line("$") | exe "normal! g'\"zz" | end

" }}}
" 80 column rule {{{2

nm <m-8> :call Toggle80ColRule()<cr>

func! Toggle80ColRule()
	if &cc == 80
		se cc=0
	else
		call Set80ColRule()
	end
endf

func! Set80ColRule()
	if exists('+colorcolumn')
		se cc=80
	else
		au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
	end
endf

" }}}
" Persistent undo {{{2

if has('persistent_undo')
	se udf
	se udir=~/.cache/vim
end
if has('unnamedplus')
	se cb=unnamed,unnamedplus
end
scripte utf-8

" }}}
" Appearance {{{2

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

" Expand quotes/parantheses automatically {{{2

ino <expr> ` getline(".")[col(".")-1]=="`" ? "`" : "``<Left>"
au FileType html,markdown ino < <><Left>
ino { {}<Left>
ino ( ()<Left>
ino [ []<Left>

" Do not expand if already did {{{3

ino <expr> <cr> getline(".")[col(".")-2:col(".")-1]=="{}" ?
			\ "<cr><esc>O" : "<cr>"
ino <expr> } getline(".")[col(".")-2:col(".")-1]=="{}" ? "<Right>" : "}" 
ino <expr> > getline(".")[col(".")-2:col(".")-1]=="<>" ? "<Right>" : ">" 
ino <expr> ) getline(".")[col(".")-2:col(".")-1]=="()" ? "<Right>" : ")" 
ino <expr> ] getline(".")[col(".")-2:col(".")-1]=="[]" ? "<Right>" : "]" 

" }}}
" }}}
" Smart Space Key {{{2

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
" Smart Backspace Key {{{2

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

" vim: set fdm=marker :
