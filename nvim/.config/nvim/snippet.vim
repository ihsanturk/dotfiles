au FileType go nm <leader>c :make<cr>
au FileType go nm <leader>g :GoDef<cr>
au FileType go nm <leader>l :GoLint<cr>
au FileType go nm <leader>t :GoTest<cr>
au FileType go nm <leader>b :GoBuild<cr>
au FileType go nm <leader>i :GoInstall<cr>

au FileType python ia ifn "if __name__ == '__main__':
au FileType python se noet ts=3 sts=3 sw=3

"Expand automatically
ino <expr> `
			\ getline(".")[col(".")-1]=="`" ? "`" : "``<Left>"
ino <expr> <
			\ getline(".")[col(".")-1]==">" ? "<" : "<><Left>"
ino <expr> "
			\ getline(".")[col(".")-1]=='"' ? '"' : '""<Left>'
ino <expr> '
			\ getline(".")[col(".")-1]=="'" ? "'" : "''<Left>"
ino <expr> {
			\ getline(".")[col(".")-1]=="}" ? "{" : "{}<Left>"
ino <expr> (
			\ getline(".")[col(".")-1]==")" ? "(" : "()<Left>"
ino <expr> [
			\ getline(".")[col(".")-1]=="]" ? "[" : "[]<Left>"

"Do not expand if did already.
ino <expr> <cr>
			\ getline(".")[col(".")-2:col(".")-1]=="{}" ? "<cr><esc>O" : "<cr>" 
ino <expr> }
			\ getline(".")[col(".")-2:col(".")-1]=="{}" ? "<Right>" : "}" 
ino <expr> >
			\ getline(".")[col(".")-2:col(".")-1]=="<>" ? "<Right>" : ">" 
ino <expr> )
			\ getline(".")[col(".")-2:col(".")-1]=="()" ? "<Right>" : ")" 
ino <expr> ]
			\ getline(".")[col(".")-2:col(".")-1]=="[]" ? "<Right>" : "]" 

func! SmartBackspace()
	let l:aroundchars = getline(".")[col(".")-2:col(".")-1]
	if (l:aroundchars=='""') ||
				\ (l:aroundchars=="''") ||
				\ (l:aroundchars=='""') ||
				\ (l:aroundchars=="``") ||
				\ (l:aroundchars=="''") ||
				\ (l:aroundchars=="{}") ||
				\ (l:aroundchars=="<>") ||
				\ (l:aroundchars=="()") ||
				\ (l:aroundchars=="[]")
		return "\<Right>\<Backspace>\<Backspace>" 
	else
		return "\<Backspace>" 
endfunc
ino <Backspace> <C-R>=SmartBackspace()<cr>
