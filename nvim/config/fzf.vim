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

