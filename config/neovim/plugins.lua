-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

	use {'wbthomason/packer.nvim', opt = true}

	use 'ihsanturk/vim-ihsensible'
	use 'ihsanturk/vim-grave-navigation'

	use 'tpope/vim-rsi'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-sensible'
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'

	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'
	use 'junegunn/vim-easy-align'

	use 'LnL7/vim-nix'
	use 'vito-c/jq.vim'
	use 'HiPhish/info.vim'
	use 'ap/vim-css-color'
	use 'reedes/vim-wheel'
	use 'ziman/ledger-vim'
	use 'mkitt/tabline.vim'
	use 'alvan/vim-closetag'
	use 'fiatjaf/neuron.vim'
	use 'mhinz/vim-sayonara'
	use 'wellle/targets.vim'
	use 'Raimondi/delimitMate'
	use 'itchyny/lightline.vim'
	use 'airblade/vim-gitgutter'
	use 'farmergreg/vim-lastplace'
	use 'nvim-lua/completion-nvim'
	use 'PeterRincker/vim-searchlight'
	use {'morhetz/gruvbox', config = vim.cmd [[ source config-plugin/gruvbox.vim ]]}

end)
