vim.api.nvim_exec([[
	au FileType ledger nm <silent> <tab> :set ep=ledger\ -f\ -\ print<cr>=
	au FileType ledger xn <silent> <tab> :<c-u>set ep=ledger\ -f\ -\ print<cr>gv=
	au FileType ledger se commentstring=;\ %s
]], true)
