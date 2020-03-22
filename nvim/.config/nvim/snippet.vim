" ============================================================================
" File:        snippet.vim
" Description: vim snippets
" Author:      ihsan <ihsanl at pm dot me>
" License:     MIT license
" ============================================================================

" Section: Python {{{1
au FileType python ia ifn "if __name__ == '__main__':

" Section: Expand quotes/parantheses automatically {{{1

ino <expr> ` getline(".")[col(".")-1]=="`" ? "`" : "``<Left>"
ino < <><Left>
ino " ""<Left>
ino ' ''<Left>
ino { {}<Left>
ino ( ()<Left>
ino [ []<Left>

" Section: Do not expand if already did. {{{2

ino <expr> <cr> getline(".")[col(".")-2:col(".")-1]=="{}" ? "<cr><esc>O" : "<cr>"
ino <expr> } getline(".")[col(".")-2:col(".")-1]=="{}" ? "<Right>" : "}" 
ino <expr> > getline(".")[col(".")-2:col(".")-1]=="<>" ? "<Right>" : ">" 
ino <expr> ) getline(".")[col(".")-2:col(".")-1]=="()" ? "<Right>" : ")" 
ino <expr> ] getline(".")[col(".")-2:col(".")-1]=="[]" ? "<Right>" : "]" 

func! SmartSpace()
	let l:aroundchars = getline(".")[col(".")-2:col(".")-1]
	if (l:aroundchars=='""') ||
	 \ (l:aroundchars=="''") ||
	 \ (l:aroundchars=="``") ||
	 \ (l:aroundchars=="<>")
		return "\<Right>\<Backspace>\<Space>" 
	else
		return "\<Space>" 
endfunc
ino <Space> <C-R>=SmartSpace()<cr>

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

" vim: set foldmethod=marker :
