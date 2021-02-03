vim.api.nvim_exec([[
	aug InfoFileType
		au FileType info nm <silent> <buffer> <space> :Follow<cr>
	aug end
]], true)
