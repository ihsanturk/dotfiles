au FileType go nm <leader>c :make<cr>
au FileType go nm <leader>g :GoDef<cr>
au FileType go nm <leader>l :GoLint<cr>
au FileType go nm <leader>t :GoTest<cr>
au FileType go nm <leader>b :GoBuild<cr>
au FileType go nm <leader>i :GoInstall<cr>

au FileType python ia ifn "if __name__ == '__main__':

ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino " ""<left>
ino ' ''<left>
ino < <><left>
ino ` ``<left>

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
