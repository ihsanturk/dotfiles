au FileType go nm <leader>c :make<cr>
au FileType go nm <leader>g :GoDef<cr>
au FileType go nm <leader>l :GoLint<cr>
au FileType go nm <leader>t :GoTest<cr>
au FileType go nm <leader>b :GoBuild<cr>
au FileType go nm <leader>i :GoInstall<cr>
au FileType c,cpp,javascript im {} {<Return><Return>}<esc>kS
au FileType python im ,in <esc>0iif __name__ == '__main__':<Return>
