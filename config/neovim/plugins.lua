-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

-- custom scripts
require('script.lynx') -- means: ~/.config/nvim/lua/script/lynx.lua

return require('packer').startup(function()

	use {'wbthomason/packer.nvim', opt = true}

	use 'ihsanturk/vim-grave-navigation' -- navigate windows and tabs using "`"
	use 'ihsanturk/vim-ihsensible'       -- better defaults

	use 'tpope/vim-rsi'                  -- readline shortcuts in insert modes
	use 'tpope/vim-sensible'             -- better defaults
	use 'tpope/vim-surround'             -- add chars around text objects
	use {'tpope/vim-fugitive', config = require('config.vim-fugitive')}

	use 'junegunn/fzf'                   -- fuzzy finder
	use {'junegunn/fzf.vim', config = require('config.fzf')}
	use {'junegunn/vim-easy-align', config = require('config.easy-align')}

	use 'PeterRincker/vim-searchlight'   -- make active search a different color
	use 'airblade/vim-gitgutter'         -- display git diff in signcolumn
	use 'alvan/vim-closetag'             -- auto close html tags
	use 'ap/vim-css-color'               -- colorize css hex/rgb colors
	use 'b3nj5m1n/kommentary'            -- comment text objects
	use 'chrisbra/Colorizer'             -- colorize ansi escape codes in buffer
	use 'darfink/vim-plist'              -- plist mode
	use 'farmergreg/vim-lastplace'       -- continue from where you left off
	use 'lifepillar/vim-solarized8'      -- solarized8 color scheme
	use 'mkitt/tabline.vim'              -- more readable tab titles
	use 'rust-lang/rust.vim'             -- rust mode
	use 'tweekmonster/startuptime.vim'   -- measure startup time
	use 'vito-c/jq.vim'                  -- jq mode
	use 'wellle/targets.vim'             -- better text objects
	use {'HiPhish/info.vim',           config = require('config.info')}
	use {'LnL7/vim-nix',               config = require('config.vim-nix')}
	use {'Raimondi/delimitMate',       config = require('config.delimitMate')}
	use {'fiatjaf/neuron.vim',         config = require('config.neuron')}
	use {'hoob3rt/lualine.nvim',       config = require('config.lualine')}
	use {'mhinz/vim-sayonara',         config = require('config.sayonara')}
	use {'neovim/nvim-lspconfig',      config = require('config.lsp')}
	use {'nvim-lua/completion-nvim',   config = require('config.completion')}
	use {'rafcamlet/nvim-luapad',      config = require('config.luapad')}
	use {'rafikdraoui/gruvbox-custom', config = require('config.gruvbox')}
	use {'reedes/vim-wheel',           config = require('config.vim-wheel')}
	use {'ziman/ledger-vim',           config = require('config.ledger')}

	-- use {'itchyny/lightline.vim', config = require('config.lightline')}

end)
