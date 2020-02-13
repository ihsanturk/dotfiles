au FileType c,cpp,javascript ia if {<Return><Return>}<Up>
au FileType c,cpp,javascript ia {} {<Return><Return>}<Up>
au FileType python ia ifn "if __name__ == '__main__':

aug golang
	au FileType go nm <leader>c :make<cr>
	au FileType go nm <leader>g :GoDef<cr>
	au FileType go nm <leader>l :GoLint<cr>
	au FileType go nm <leader>t :GoTest<cr>
	au FileType go nm <leader>b :GoBuild<cr>
	au FileType go nm <leader>i :GoInstall<cr>
aug END

aug general-programming
aug END

" :aug[roup] {name}
" :au[tocmd] [group] {event} {pat} [++once] [++nested] {cmd}
