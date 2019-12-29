autocmd FileType go nmap <leader>c :make<cr>
autocmd FileType go nmap <leader>l :GoLint<cr>
autocmd FileType go nmap <leader>b :GoBuild<cr>
autocmd FileType c,cpp,javascript imap {} {<Return><Return>}<esc>kS
autocmd FileType python imap ,in <esc>0iif __name__ == '__main__':<Return>
