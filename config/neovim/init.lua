-- install packer.nvim automatically
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
	execute 'packadd packer.nvim'
end

require 'plugins'

vim.wo.wrap = false
vim.wo.number = true
vim.wo.signcolumn = 'number'
vim.wo.relativenumber = true
vim.wo.colorcolumn = vim.wo.colorcolumn .. '+' .. 0 -- of textwidth

vim.o.mouse = 'a'
vim.o.tabstop = 3
vim.o.syntax = 'on'
vim.o.shiftwidth = 3
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.autoindent = true
vim.o.ignorecase = true
vim.o.expandtab = false

vim.o.formatoptions = 'tcqjrn'
vim.o.listchars = 'tab:┊ ,trail:•,nbsp:+'
vim.o.virtualedit = vim.o.virtualedit .. 'block' -- select beyond end of the line
vim.o.textwidth = 79 -- TODO: make 50 when gitcommit files

-- TODO: luaify config.vim

vim.cmd [[
au FileType nix,python,vim,rust set ts=3 sts=3 sw=3 tw=79 noet

" live search change
if has('inccommand')
	set inccommand=nosplit
end

" completion
set completeopt=menu,noselect,preview
autocmd CompleteDone * pclose

" appearance
if $COLORTERM == 'truecolor'
	set termguicolors
end
if $TERM =~ '^\(rxvt\|screen\|interix\|putty\)\(-.*\)\?$'
	set notermguicolors
elseif $TERM =~ '^\(tmux\|iterm\|vte\|gnome\)\(-.*\)\?$'
	set termguicolors
endif
hi! link ColorColumn Visual
nn <silent> <c-c> :noh<cr>

" sort text-objects " TODO: pluginize-vip
nm <silent> gss :set ep=sort<cr>=
nm <silent> gsr :set ep=sort\ -R<cr>=
nm <silent> gsl :set ep=sortlength<cr>=
xn <silent> gss :<C-U>set ep=sort<cr>gv=
xn <silent> gsr :<C-U>set ep=sort\ -R<cr>gv=
xn <silent> gsl :<C-U>set ep=sortlength<cr>gv=
" ---
nm <leader>g :set ep=gt<cr>=
xn <leader>g :<C-U>set ep=gt<cr>gv=
xn <leader>w :!xargs wikipedia 2>/dev/null<cr>
nm <leader>w :exe '!wikipedia '.expand('<cword>')<cr>
" xn <leader>s :!sozlukgovtr<cr>
" nn <leader>s :exe '!sozlukgovtr '.expand('<cword>')<cr>

"abbrv
ia	teh	the
if exists("*strftime")
	ia	timestamp	<c-r>=strftime('%s')<cr>
	ia	ts	<c-r>=strftime('%s')<cr>
	ia	today	<c-r>=strftime("%Y %b %d")<cr>
	ia	now	<c-r>=strftime('%Y-%m-%d %X')<cr>
end

" cpwd -> copy pwd
cabbrev cpwd let @* = expand("%:p:h")

" cd -> tcd
cabbrev cd tcd

" typo
ca W w
ca Q q
ca WQ wq
ca Wq w
ca E e
ca Vs vs
ca VS vs
ca Sp sp
ca SP sp

" pivot scroll
if has('nvim') == 0 " apply just for vim
	nn <silent> <c-j> <esc><c-e>j
	nn <silent> <c-k> <esc><c-y>k
end

" write and buffer delete/close/kill buffer
cnorea wbd w\|:bd
cnorea wd w\|:bd
cnorea Wd w\|:bd
cnorea WD w\|:bd

" external commands
func! CnoreaOnlyPattern(lhs, rhs, pattern)
	exe 'cnoreabbrev <expr> '.a:lhs.
		\ ' (getcmdtype() == ":" && getcmdline() =~ "'.a:pattern.
		\ '")? "'.a:rhs.'" : "'.a:lhs.'"'
endf
func! UnixExecutable(name)
	call CnoreaOnlyPattern(a:name, '!'.a:name, '^'.a:name.'$')
endf
call UnixExecutable('mv')
call UnixExecutable('rm')
call UnixExecutable('open')
call UnixExecutable('mkdir')
call CnoreaOnlyPattern('learn', 'tcd '.$DIR_LEARN.'/', '^learn$') " use: C-]

" spaces to tabs
cabbrev s2t s/  /\t/g
cabbrev s4t s/    /\t/g
cabbrev s8t s/        /\t/g

" word search
nn g/ /\<\><left><left><c-r>/<cr>

" fucking annoying <c-c> sql completion
let g:omni_sql_no_default_maps = 1

]]
