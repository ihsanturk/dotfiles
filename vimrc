" Autohor: ihsan <ihsanl [a_t] pm.me>
" License: public domain, use however you want.

let g:level = 1
let g:levels = { 0: "tiny", 1: "full" }
let mapleader = "\<space>"
if has('nvim')
	let g:vimplugpath = stdpath('data') . '/plugged'
else
	let g:vimplugpath='~/.vim/plugged'
end
nn <silent><leader>1 :let g:level=(g:level+1)%len(g:levels)\|call Level(g:level)<cr>


func! Level(l)

	if (a:l >= 0)
		if has('nvim') " vim blocks the ui so don't notify
			if (a:l == 0)
				echo 'g:level: '.g:levels[g:level].' (change with <leader>1)'
			end
		end

		runtime ftplugin/man.vim
		runtime ftplugin/help.vim
		runtime ftplugin/vim.vim

		lang en_GB.UTF-8

		" settings
		set autoindent
		set backupcopy=yes " entr twice, https://superuser.com/a/1569733/1229839
		set cc=+1
		set hlsearch
		set incsearch
		set laststatus=2
		set list
		set listchars=tab:\┊\ ,trail:•,nbsp:+
		set mouse=
		set noignorecase
		set noswapfile
		set nowrap
		set nu rnu
		set ru
		set signcolumn=number
		set smartcase
		set sw=3 ts=3
		set tw=80
		set wildignore+=*.bmp,*.gif,*.ico,*.ico,*.o,*.psd,*.a
		set wildignore+=node_modules/*,bower_components/*
		set wildmenu
		syn on

		let g:netrw_banner = 0 " hide netrw info section

		if has('unnamedplus')
			set clipboard=unnamedplus
		end

		if !has('nvim')
			set nocompatible
		else " has nvim
			set inccommand=nosplit
		end

		" au commands
		au FileType man setl nolist " better man
		if has('nvim') " better term
			au TermOpen setl nonu nornu nolist
		else
			au TerminalWinOpen setl nonu nornu nolist
		endif

		" basic mapping and abbreviation
		ca log tabe ~/log/life \| norm G \| zz
		ca rc exe 'tabe ~/dot \| tcd ~/dot'
		ca tp exe 'tabe ~/zk/'.strftime('%Y-%m-%d').'.md \| tcd ~/zk/'
		nn <silent>zk :tabe ~/zk/ \| tcd ~/zk<cr>
		nn <c-c> <c-[>:noh<cr><c-[>
		nn <c-j> <c-e>j
		nn <c-k> <c-y>k
		nn <leader>d :exe 'r!date -u'\|norm kJ<cr>$
		nn <leader>t :exe 'r!date +\%H:\%M'\|norm kJ<cr>$
		nn <silent><leader>s :source %<cr>:exe ':echom "sourced: ".expand("%")'<cr>
		nn cn :cnext<cr>
		nn cp :cprev<cr>

		" readline
		cno <c-a> <c-b>
		cno <c-b> <left>
		cno <c-d> <del>
		cno <c-f> <right>
		im <c-a> <c-o>0
		im <c-b> <left>
		im <c-d> <c-o>x
		im <c-e> <c-o>$
		im <c-f> <right>

		" typo
		cnorea E e
		cnorea Q q
		cnorea SP sp
		cnorea Sp sp
		cnorea VS vs
		cnorea Vs vs
		cnorea W w
		cnorea WD w\|:bd
		cnorea WQ wq
		cnorea Wd w\|:bd
		cnorea Wq wq
		cnorea cd tcd
		cnorea cdc tcd %:p:h<cr>
		cnorea Cdc tcd %:p:h<cr>
		cnorea man Man
		cnorea wbd w\|:bd
		cnorea wd w\|:bd

		hi! link ColorColumn CursorColumn
		hi! link Search Todo
		" hi! link Visual VisualNOS

		" better :make
		nn <leader>c :make \| unsilent redraw! \| bo cwindow<cr>
		ca make make \| unsilent redraw! \| bo cwindow

		" [external snippet manager](https://github.com/ihsanturk/snip)
		nn <leader>e :exe ':set ep=snip\ -l'.&ft<cr>=
		xn <leader>e :<c-u>exe ':set ep=snip\ -l'.&ft<cr>gv=

	endif
	if (a:l >= 1)

		if has('nvim') " vim block the ui so don't notify
			if (a:l == 1)
				echo 'g:level: '.g:levels[g:level].' (change with <leader>1)'
			end
		end

		" install vimplug automatically
		let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
		if empty(glob(data_dir . '/autoload/plug.vim'))
			silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
			autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
		endif
		" Run PlugInstall if there are missing plugins
		autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
			\| PlugInstall --sync | source $MYVIMRC
		\| endif

		call plug#begin(g:vimplugpath)

		" Plug ('tpope/vim-sensible')            " sane defaults
		" Plug ('tweekmonster/startuptime.vim')  " measure startup time

		Plug 'PeterRincker/vim-searchlight'   " make active search different color
		Plug 'airblade/vim-gitgutter'         " display git diff in signcolumn
		Plug 'alvan/vim-closetag'             " auto close html tags
		Plug 'ap/vim-css-color'               " colorize css hex/rgb colors
		Plug 'chrisbra/Colorizer'             " colorize ansi escapes in buffer
		Plug 'darfink/vim-plist'              " plist mode
		Plug 'farmergreg/vim-lastplace'       " continue from where you left off
		Plug 'ihsanturk/vim-grave-navigation' " navigate tabs using '`'
		Plug 'ihsanturk/vim-ihsensible'       " sane defaults
		Plug 'jbmorgado/vim-pine-script'      " tradingview pinescript mode
		Plug 'junegunn/fzf'                   " fuzzy finder
		Plug 'keith/swift.vim'                " swift mode
		Plug 'mkitt/tabline.vim'              " more readable tab titles
		Plug 'rust-lang/rust.vim'             " rust mode
		Plug 'tpope/vim-rsi'                  " readline shortcuts in insert modes
		Plug 'tpope/vim-speeddating'          " {in,de}crement dates: <c-{a,x}>
		Plug 'tpope/vim-surround'             " add chars around text objects
		Plug 'vito-c/jq.vim'                  " jq mode
		Plug 'wellle/targets.vim'             " better text objects

		if has('nvim')
			Plug 'b3nj5m1n/kommentary'         " comment text objects
			Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
			Plug 'p00f/nvim-ts-rainbow'        " different brace/parant. colors
			Plug 'rafcamlet/nvim-luapad'

			Plug 'neovim/nvim-lspconfig'
			nn <silent> <c-tab>   <cmd>lua vim.lsp.buf.formatting()<cr>
			nn <silent> <space>rn <cmd>lua vim.lsp.buf.rename()<cr>
			nn <silent> [d        <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>
			nn <silent> ]d        <cmd>lua vim.lsp.diagnostic.goto_next()<cr>
			nn <silent> gD        <cmd>lua vim.lsp.buf.declaration()<cr>
			nn <silent> gd        <cmd>lua vim.lsp.buf.definition()<cr>
			nn <silent> gh        <cmd>lua vim.lsp.buf.hover()<cr>
			nn <silent> gi        <cmd>lua vim.lsp.buf.implementation()<cr>
			nn <silent> gr        <cmd>lua vim.lsp.buf.references()<cr>
			nn <silent> gs        <cmd>lua vim.lsp.buf.signature_help()<cr>
			xn <silent> <c-tab>   :lua vim.lsp.buf.range_formatting()<cr>

		else
			Plug 'tpope/vim-commentary'        " comment text objects

			Plug 'luochen1990/rainbow'         " different brace/parant. colors
			let g:rainbow_active = 1

		end


		Plug 'tpope/vim-fugitive'
		aug fugitive
			ca git Git
			ca gw  Gwrite
			ca Gw  Gwrite
			ca GW  Gwrite
			ca ga  Git add
			ca Ga  Git add
			ca GA  Git add
			ca gl  vert Git log
			ca Gl  vert Git log
			ca GL  vert Git log
			ca grm GRemove
			ca Grm GRemove
			ca GRm GRemove
			ca gd  vert Git diff
			ca Gd  vert Git diff
			ca GD  vert Git diff
			ca gp  Gpush
			ca Gp  Gpush
			ca GP  Gpush
			ca gs  vert Gstatus
			ca Gs  vert Gstatus
			ca GS  vert Gstatus
			ca gc  tab Git commit
			ca Gc  tab Git commit
			ca GC  tab Git commit
		aug end

		Plug 'junegunn/fzf.vim'
		nm <m-f> :Files<cr>
		nm <m-s> :BLines<cr>
		nm <m-b> :Buffers<cr>
		nm <m-r> :History<cr>
		nm <m-x> :Commands<cr>
		nm <m-h> :Helptags!<cr>
		tma <m-r> <c-\><c-n>:History<cr>
		let g:fzf_layout = { 'down': '~40%' }
		imap <c-x><c-k> <plug>(fzf-complete-word)
		imap <c-x><c-l> <plug>(fzf-complete-buffer-line)
		" nm <silent> <m-2> :call fzf#run({'sink': 'e', 'left': '30%'})<cr>
		let g:fzf_preview_window = [] " do not show preview window
		let g:fzf_commands_expect = 'alt-enter'
		let g:fzf_colors = {
			\ 'fg':      ['fg', 'Normal'],
			\ 'bg':      ['bg', 'Normal'],
			\ 'hl':      ['fg', 'Comment'],
			\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
			\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'info':    ['fg', 'PreProc'],
			\ 'border':  ['fg', 'Ignore'],
			\ 'prompt':  ['fg', 'Conditional'],
			\ 'pointer': ['fg', 'Exception'],
			\ 'marker':  ['fg', 'Keyword'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'Comment']
		\}
		func! Dirname(key, val)
			return fnamemodify(a:val, ":h")
		endf
		func! OldDirs() " (unique dirs)
			call fzf#run(fzf#wrap({'sink':'tcd',
				\ 'source':uniq(sort(map(deepcopy(v:oldfiles), function('Dirname'))))}),
			\ {'options': [ '--prompt', 'Recent Dirs' ]})
		endf
		nm <silent> <m-d> :call OldDirs()<cr>

		Plug 'junegunn/vim-easy-align'
		xm ga <Plug>(EasyAlign)
		nm ga <Plug>(EasyAlign)

		Plug 'HiPhish/info.vim'
		aug InfoFileType
			au FileType info nm <silent> <buffer> <space> :Follow<cr>
		aug end

		Plug 'LnL7/vim-nix'
		let nix_recommended_style = 0

		Plug 'reedes/vim-wheel'
		let g:wheel#map#down = '<c-j>'
		let g:wheel#map#up   = '<c-k>'

		Plug 'ziman/ledger-vim'
		au FileType ledger nm <silent><tab> :set ep=ledger\ -f\ -\ print<cr>=
		au FileType ledger xn <silent><tab> :<c-u>set ep=ledger\ -f\ -\ print<cr>gv=
		au FileType ledger se commentstring=;\ %s

		Plug 'Raimondi/delimitMate'
		let delimitMate_expand_cr = 2
		let delimitMate_expand_space = 1
		au FileType markdown let b:delimitMate_nesting_quotes = ['`']
		au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
		au FileType html let b:delimitMate_matchpairs = "(:),[:],{:}" " vim-closetag

		Plug 'mhinz/vim-sayonara'
		nn <silent><m-k> :Sayonara!<cr>
		tma <silent> <m-k> <c-\><c-n>:Sayonara!<cr>

		Plug 'morhetz/gruvbox'
		let g:gruvbox_invert_selection = 0

		if (a:l == 1)
			call plug#end()
		end

		function! ChangeBackground()
			if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
				set bg=dark
			else
				"set bg=light
			endif
			" color gruvbox
			color default
		endf

		" set tgc
		" let g:gruvbox_transparent_bg=1
		" color gruvbox
		color default

		call ChangeBackground()
		if has('nvim')
			autocmd Signal SIGUSR1 call ChangeBackground()
		end

" WARNING: THIS SHOULD NOT BE INDENTED
if has('nvim')
lua <<EOF

-- lsp
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
	vim.lsp.handlers.signature_help, {
		-- Use a sharp border with `FloatBorder` highlights
		border = "single"
	}
)
-- disable diagnostcs globally
vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
	-- See `:help vim.lsp.*` for documentation
end
local servers = { "clangd" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup { on_attach = on_attach }
end

-- incremental syntax highlighting
require'nvim-treesitter.configs'.setup {
	ensure_installed = "maintained",
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 1000, -- do not enable for files with more than 1000 loc
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		-- disable = { "c", "python", "bash", "rust" }, -- list of language that will be disabled
	},
}

EOF
" WARNING: THIS SHOULD NOT BE INDENTED
end

	endif
endf

call Level(g:level)

noh " clear highlighting on start
