vim.api.nvim_set_keymap('n', '<m-k>', ':Sayonara!<cr>', {silent = true})
vim.api.nvim_set_keymap(
	't', '<m-k>', '<c-\\><c-n><:Sayonara!<cr>', {silent = true})
