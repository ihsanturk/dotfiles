-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

-- custom scripts
require('script.lynx') -- means: ~/.config/nvim/lua/script/lynx.lua

return require('packer').startup(function()

	use {'wbthomason/packer.nvim', opt = true}

	use 'ihsanturk/vim-grave-navigation' -- navigate windows and tabs using "`"
	use 'ihsanturk/vim-ihsensible'       -- sane defaults

	use 'tpope/vim-rsi'                  -- readline shortcuts in insert modes
	use 'tpope/vim-sensible'             -- sane defaults
	use 'tpope/vim-surround'             -- add chars around text objects
	use {'tpope/vim-fugitive', config = require('config.vim-fugitive')}

	use 'junegunn/fzf'                   -- fuzzy finder
	use {'junegunn/fzf.vim', config = require('config.fzf')}
	use {'junegunn/vim-easy-align', config = require('config.easy-align')}

	--[[ -- (has couple of problems)
	-- zettelkasten style note taking using neuron
	use "nvim-lua/plenary.nvim"
	use "nvim-telescope/telescope.nvim"
	use 'nvim-lua/popup.nvim'
	use {'oberblastmeister/neuron.nvim', config = require('config.neuron-nvim')} ]]

	use 'PeterRincker/vim-searchlight'    -- make active search different color
	use 'airblade/vim-gitgutter'          -- display git diff in signcolumn
	use 'alvan/vim-closetag'              -- auto close html tags
	use 'ap/vim-css-color'                -- colorize css hex/rgb colors
	use 'b3nj5m1n/kommentary'             -- comment text objects
	use 'chrisbra/Colorizer'              -- colorize ansi escapes in buffer
	use 'darfink/vim-plist'               -- plist mode
	use 'farmergreg/vim-lastplace'        -- continue from where you left off
	use 'lifepillar/vim-solarized8'       -- solarized8 color scheme
	use 'mkitt/tabline.vim'               -- more readable tab titles
	use 'rust-lang/rust.vim'              -- rust mode
	use 'tweekmonster/startuptime.vim'    -- measure startup time
	use 'vito-c/jq.vim'                   -- jq mode
	use 'wellle/targets.vim'              -- better text objects

	use {
		'nvim-treesitter/nvim-treesitter', -- better syntax highlighter
		config = require('config.treesitter'),
		-- run = ':TSUpdate' -- some parsers can't be compiled, so do not update
	}

	use {
		'fiatjaf/neuron.vim',             -- zettelkasten style note taking
		-- 'chiefnoah/neuron-v2.vim',
		config = require('config.neuron'),
		-- ft = "markdown"
	}

	use {
		'HiPhish/info.vim',               -- info mode
		config=require('config.info')
	}

	use {
		'LnL7/vim-nix',                   -- nix mode
		config=require('config.vim-nix'),
		-- ft = "nix"
	}

	use {
		'hoob3rt/lualine.nvim',           -- status line
		config=require('config.lualine')
	}

	--[[ use {
		'nvim-lua/completion-nvim',       -- auto completion
		config=require('config.completion')
	} ]]

	use {
		'rafikdraoui/gruvbox-custom',     -- favorite color scheme
		config=require('config.gruvbox')
	}

	use {
		'reedes/vim-wheel',                -- pivot scroll
		config=require('config.vim-wheel')
	}

	use {
		'ziman/ledger-vim',                -- ledger-cli mode
		config=require('config.ledger'),
		-- ft = 'ledger' -- this breaks the detection
	}

	use {
		'Raimondi/delimitMate',            -- smart close parentheses and braces
		config = require('config.delimitMate')
	}

	use {
		'mhinz/vim-sayonara',               -- close buffer without closing window
		config = require('config.sayonara')
	}

	--[[ use {
		'neovim/nvim-lspconfig',            -- language server protocol
		config = require('config.lsp')
	} ]]

	use { -- (BE CAREFUL, it runs everything you paste in scratch pad)
		'rafcamlet/nvim-luapad',            -- live code in lua
		config = require('config.luapad')
	}

	-- use {'itchyny/lightline.vim', config = require('config.lightline')}

end)
