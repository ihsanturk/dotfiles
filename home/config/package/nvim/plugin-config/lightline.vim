let g:lightline = {
	\'colorscheme': 'gruvbox',
	\'active': {
	\	'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'relativepath' ] ],
	\},
	\'component_function': {
	\	'fugitive': 'LightlineFugitive',
	\},
\}
function! LightlineFugitive()
	if exists('*FugitiveHead')
		return FugitiveHead()
	endif
	return ''
endfunction
