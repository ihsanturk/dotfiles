let g:lightline = {
	\'colorscheme': 'gruvbox',
	\'active': {
	\	'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'relativepath' ] ],
	\},
	\'component_function': {
	\	'fugitive': 'LightlineFugitive',
	\	'relativepath': 'LightlineRelativepath',
	\},
\}

function! LightlineFugitive()
	if exists('*FugitiveHead')
		return FugitiveHead()
	endif
	return ''
endfunction

func! LightlineRelativepath()
	if mode() == 't'
		return ''
	else
		return expand('%')
endf
