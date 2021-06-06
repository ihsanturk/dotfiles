" Autohor: ihsan <ihsanl [a_t] pm.me>
" License: public domain, use however you want.


let g:level = 0
let g:levels = { 0: "tiny", 1: "middle", 2: "bloat" }
let mapleader = "\<space>"
if has('nvim')
	let g:vimplugpath = stdpath('data') . '/plugged'
else
	let g:vimplugpath='~/.vim/plugged'
end
nn <silent><leader>1 :let g:level = (g:level+1) % 3 \| call Level(g:level)<cr>


func! Level(l)

	if (a:l >= 0)
		if has('nvim') " vim block the ui so don't notify
			if (a:l == 0)
				echo 'g:level: tiny (change with <leader>1)'
			end
		end

		runtime ftplugin/man.vim
		runtime ftplugin/help.vim
		runtime ftplugin/vim.vim

		" settings
		set autoindent
		set background=light
		set backupcopy=yes " entr twice, https://superuser.com/a/1569733/1229839
		set cc=+1
		set hlsearch
		set ignorecase
		set incsearch
		set laststatus=2
		set list
		set listchars=tab:\┊\ ,trail:•,nbsp:+
		set noswapfile
		set nu rnu
		set ru
		set signcolumn=number
		set sw=3 ts=3
		set tw=80
		set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.o,*.pdf,*.psd,*.a
		set wildignore+=node_modules/*,bower_components/*
		set wildmenu
		syn on

		if has('unnamedplus')
			clipboard=unnamedplus
		end

		if !has('nvim')
			set nocompatible
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
		ca rc exe 'tabe ~/dot'
		ca tp exe 'tabe ~/zk/'.strftime('%Y-%m-%d').'.md'
		nn <c-c> <c-[>:noh<cr><c-[>
		nn <c-j> <c-e>j
		nn <c-k> <c-y>k
		nn <leader>d :exe 'r!date -u'\|norm kJ<cr>$
		nn <leader>t :exe 'r!date +\%H:\%M:\%S'\|norm kJ<cr>$
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
		cnorea man Man
		cnorea wbd w\|:bd
		cnorea wd w\|:bd

		hi! link ColorColumn CursorColumn
		hi! link Search Todo
		hi! link Visual VisualNOS

		" better :make
		nn <leader>c :silent make \| unsilent redraw! \| bo cwindow<cr>
		ca make silent make \| unsilent redraw! \| bo cwindow

		" [external snippet manager](https://github.com/ihsanturk/snip)
		nn <leader>e :exe ':set ep=snip\ -l'.&ft<cr>=
		xn <leader>e :<c-u>exe ':set ep=snip\ -l'.&ft<cr>gv=

	endif
	if (a:l >= 1)

		if has('nvim') " vim block the ui so don't notify
			if (a:l == 1)
				echo 'g:level: middle (change with <leader>1)'
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

		Plug('PeterRincker/vim-searchlight')   " make active search different color
		Plug('airblade/vim-gitgutter')         " display git diff in signcolumn
		Plug('alvan/vim-closetag')             " auto close html tags
		Plug('ap/vim-css-color')               " colorize css hex/rgb colors
		Plug('darfink/vim-plist')              " plist mode
		Plug('farmergreg/vim-lastplace')       " continue from where you left off
		Plug('ihsanturk/vim-grave-navigation') " navigate tabs using '`'
		Plug('ihsanturk/vim-ihsensible')       " sane defaults
		Plug('jbmorgado/vim-pine-script')      " tradingview pinescript mode
		Plug('junegunn/fzf')                   " fuzzy finder
		Plug('keith/swift.vim')                " swift mode
		Plug('mkitt/tabline.vim')              " more readable tab titles
		Plug('rust-lang/rust.vim')             " rust mode
		Plug('sheerun/vim-polyglot')           " syntax highlighting for languages
		Plug('tpope/vim-rsi')                  " readline shortcuts in insert modes
		Plug('tpope/vim-speeddating')          " {in,de}crement dates: <c-{a,x}>
		Plug('tpope/vim-surround')             " add chars around text objects
		Plug('vito-c/jq.vim')                  " jq mode
		Plug('wellle/targets.vim')             " better text objects

		Plug('tpope/vim-fugitive')
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

		Plug('junegunn/fzf.vim')
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

		Plug('junegunn/vim-easy-align')
		xm ga <Plug>(EasyAlign)
		nm ga <Plug>(EasyAlign)

		Plug('HiPhish/info.vim')
		aug InfoFileType
			au FileType info nm <silent> <buffer> <space> :Follow<cr>
		aug end

		Plug('LnL7/vim-nix')
		let nix_recommended_style = 0

		Plug('reedes/vim-wheel')
		let g:wheel#map#down = '<c-j>'
		let g:wheel#map#up   = '<c-k>'

		Plug('ziman/ledger-vim')
		au FileType ledger nm <silent><tab> :set ep=ledger\ -f\ -\ print<cr>=
		au FileType ledger xn <silent><tab> :<c-u>set ep=ledger\ -f\ -\ print<cr>gv=
		au FileType ledger se commentstring=;\ %s

		Plug('Raimondi/delimitMate')
		let delimitMate_expand_cr = 2
		let delimitMate_expand_space = 1
		au FileType markdown let b:delimitMate_nesting_quotes = ['`']
		au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
		au FileType html let b:delimitMate_matchpairs = "(:),[:],{:}" " vim-closetag

		Plug('mhinz/vim-sayonara')
		nn <silent><m-k> :Sayonara!<cr>
		tma <silent> <m-k> <c-\><c-n>:Sayonara!<cr>

		if has('nvim')                         " comment text objects
			Plug 'b3nj5m1n/kommentary'
			Plug('rafcamlet/nvim-luapad')
		else
			Plug('tpope/vim-commentary')
		end


		if (a:l == 1)
			call plug#end()
		end

	endif
	if (a:l >= 2)

		if has('nvim') " vim block the ui so don't notify
			if (a:l == 2)
				echo 'g:level: bloat (change with <leader>1)'
			end
		end

		" color gruvbox
		Plug('chrisbra/Colorizer')             " colorize ansi escapes in buffer

		if (a:l == 2)
			call plug#end()
		end

	endif
endf

call Level(g:level)
noh " clear highlighting on start
