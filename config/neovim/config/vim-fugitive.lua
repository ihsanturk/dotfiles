vim.api.nvim_exec([[
aug fugitive

	ca git Git

	ca gw  Gwrite
	ca Gw  Gwrite
	ca GW  Gwrite

	ca ga  Git add
	ca Ga  Git add
	ca GA  Git add

	ca gl  Git log
	ca Gl  Git log
	ca GL  Git log

	ca grm GRemove
	ca Grm GRemove
	ca GRm GRemove

	ca gd  Git diff
	ca Gd  Git diff
	ca GD  Git diff

	ca gp  Gpush
	ca Gp  Gpush
	ca GP  Gpush

	ca gs  Gstatus
	ca Gs  Gstatus
	ca GS  Gstatus

	ca gc  tab Git commit
	ca Gc  tab Git commit
	ca GC  tab Git commit

aug end
]], true)
