au FileType ledger setl opfunc=ledger#autocomplete_and_align()
au FileType ledger inoremap <silent> <tab> <c-r>=ledger#autocomplete_and_align()<cr>
au FileType ledger nn <silent> <tab> g@
au FileType ledger vnoremap <silent> <tab> g@
