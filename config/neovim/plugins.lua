-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

	use {'wbthomason/packer.nvim', opt = true}

	use 'ihsanturk/vim-ihsensible'
	use 'ihsanturk/vim-grave-navigation'

	use 'tpope/vim-rsi'
	use 'tpope/vim-sensible'
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'
	use {'tpope/vim-fugitive', config = require('config.vim-fugitive')}

	use 'junegunn/fzf'
	use {'junegunn/fzf.vim', config = require('config.fzf')}
	use {'junegunn/vim-easy-align', config = require('config.easy-align')}

	use 'vito-c/jq.vim'
	use 'ap/vim-css-color'
	use 'alvan/vim-closetag'
	use 'wellle/targets.vim'
	use 'airblade/vim-gitgutter'
	use 'farmergreg/vim-lastplace'
	use 'nvim-lua/completion-nvim'
	use 'PeterRincker/vim-searchlight'
	use {'LnL7/vim-nix', config = require('config.vim-nix')}
	use {'HiPhish/info.vim', config = require('config.info')}
	use {'morhetz/gruvbox', config = require('config.gruvbox')}
	use {'ziman/ledger-vim', config = require('config.ledger')}
	use {'fiatjaf/neuron.vim', config = require('config.neuron')}
	use {'reedes/vim-wheel', config = require('config.vim-wheel')}
	use {'mhinz/vim-sayonara', config = require('config.sayonara')}
	use {'hoob3rt/lualine.nvim', config = require('config.lualine')}
	use {'Raimondi/delimitMate', config = require('config.delimitMate')}

	-- use {'itchyny/lightline.vim', config = require('config.lightline')}

end)
