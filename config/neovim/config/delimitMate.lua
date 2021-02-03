vim.cmd [[ let delimitMate_expand_cr = 2 ]]
vim.cmd [[ let delimitMate_expand_space = 1 ]]
vim.cmd [[ au FileType markdown let b:delimitMate_nesting_quotes = ['`'] ]]
vim.cmd [[ au FileType python let b:delimitMate_nesting_quotes = ['"', "'"] ]]
vim.cmd [[ au FileType html let b:delimitMate_matchpairs = "(:),[:],{:}" " vim-closetag ]]
