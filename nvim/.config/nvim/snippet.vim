autocmd FileType go nmap <leader>c :make<cr>
autocmd FileType go nmap <leader>g :GoDef<cr>
autocmd FileType go nmap <leader>l :GoLint<cr>
autocmd FileType go nmap <leader>t :GoTest<cr>
autocmd FileType go nmap <leader>b :GoBuild<cr>
autocmd FileType go nmap <leader>i :GoInstall<cr>
autocmd FileType c,cpp,javascript imap {} {<Return><Return>}<esc>kS
autocmd FileType python imap ,in <esc>0iif __name__ == '__main__':<Return>
