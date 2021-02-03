vim.fn.nvim_set_keymap('n', '<m-f>', ':Files<cr>', {})
vim.fn.nvim_set_keymap('n', '<m-s>', ':BLines<cr>', {})
vim.fn.nvim_set_keymap('n', '<m-b>', ':Buffers<cr>', {})
vim.fn.nvim_set_keymap('n', '<m-r>', ':History<cr>', {})
vim.fn.nvim_set_keymap('n', '<m-x>', ':Commands<cr>', {})
vim.fn.nvim_set_keymap('n', '<m-h>', ':Helptags!<cr>', {})
vim.fn.nvim_set_keymap('t', '<m-r>', '<c-\\><c-n>:History<cr>', {})

vim.fn.nvim_set_keymap('i', '<c-x><c-k>', '<plug>(fzf-complete-word)', {})
vim.fn.nvim_set_keymap('i','<c-x><c-l>','<plug>(fzf-complete-buffer-line)', {})

-- nm <silent> <m-2> :call fzf#run({'sink': 'e', 'left': '30%'})<cr>

-- vim.g.fzf_layout = {down = '~40%'}

vim.g.fzf_layout = {
	window = {
		width = 0.9,
		height = 0.6,
		-- border = "sharp"
	},
}

vim.g.fzf_preview_window = {} -- do not show preview window
vim.g.fzf_commands_expect = 'alt-enter'

vim.g.fzf_colors = {
	fg      = {'fg', 'Normal'},
	bg      = {'bg', 'Normal'},
	hl      = {'fg', 'Comment'},
	['fg+'] = {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
	['bg+'] = {'bg', 'CursorLine', 'CursorColumn'},
	['hl+'] = {'fg', 'Statement'},
	info    = {'fg', 'PreProc'},
	-- border  = {'fg', 'Ignore'},
	prompt  = {'fg', 'Conditional'},
	pointer = {'fg', 'Exception'},
	marker  = {'fg', 'Keyword'},
	spinner = {'fg', 'Label'},
	header  = {'fg', 'Comment'}
}

vim.api.nvim_exec([[

	func! Dirname(key, val)
		return fnamemodify(a:val, ":h")
	endf

	func! OldDirs() " (unique dirs)
		call fzf#run(fzf#wrap({'sink':'tcd',
			\ 'source':uniq(sort(map(deepcopy(v:oldfiles), function('Dirname'))))}),
		\ {'options': [ '--prompt', 'Recent Dirs' ]})
	endf

	nm <silent> <m-d> :call OldDirs()<cr>
]], true)
