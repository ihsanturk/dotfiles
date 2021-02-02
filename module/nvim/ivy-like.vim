
" INCOMPLETE SCRIPT

" ivy like cd or open
command! EFZF call fzf#run({'source': 'find -d1', 'sink': 'Open' 'window': '10new'})
cnorea ef EFZF<cr>

func! Open(fileordir)
	if (a:fileordir)
endf
