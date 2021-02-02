-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()

	use {'wbthomason/packer.nvim', opt = true}

	use 'lifepillar/vim-gruvbox8'
	use '9mm/vim-closer'
	use 'LnL7/vim-nix'

end)

