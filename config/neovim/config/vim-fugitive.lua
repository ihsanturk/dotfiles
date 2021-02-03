vim.api.nvim_exec([[
aug fugitive

	ca git Git

	ca gw  Gwrite
	ca Gw  Gwrite
	ca GW  Gwrite

	ca ga  Git add
	ca Ga  Git add
	ca GA  Git add

	ca gl  vert Git log
	ca Gl  vert Git log
	ca GL  vert Git log

	ca grm GRemove
	ca Grm GRemove
	ca GRm GRemove

	ca gd  vert Git diff
	ca Gd  vert Git diff
	ca GD  vert Git diff

	ca gp  Gpush
	ca Gp  Gpush
	ca GP  Gpush

	ca gs  vert Gstatus
	ca Gs  vert Gstatus
	ca GS  vert Gstatus

	ca gc  tab Git commit
	ca Gc  tab Git commit
	ca GC  tab Git commit

aug end
]], true)
