{ config, pkgs, lib, ... }:
let
	
	# term = config.settings.terminal;
	custom = import ./plugins.nix { inherit pkgs; };

in {

	programs.neovim = {

		enable = true;
		viAlias = false;
		vimAlias = false;
		plugins = with pkgs.vimPlugins; [

			custom.info-vim
			custom.vim-wheel
			custom.ledger-vim
			custom.neuron-vim
			custom.tabline-vim
			custom.vim-ihsensible
			custom.vim-searchlight
			custom.vim-grave-navigation
			# custom.code-stats-vim  # slowwwww

			# ui
			vim-devicons
			gruvbox-community
			# nerdtree-git-plugin

			fzf-vim
			vim-nix
			vim-rsi
			goyo-vim
			delimitMate
			targets-vim
			vim-fugitive
			vim-sayonara
			vim-sensible
			vim-surround
			lightline-vim
			limelight-vim
			vim-css-color
			vim-gitgutter
			vim-lastplace
			vim-commentary
			vim-easy-align
			vim-nerdtree-syntax-highlight
			# vim-ledger # does not follow the philosophy # does not support opfunc

			# rare
			# nerdtree
			# calendar-vim
			# custom.v-vim
			# custom.twitvim
			# custom.ihlog-vim
			# custom.vim-tureng
			# custom.vim-templates
			# custom.vim-you-autocorrect

			# broken
			# lsp_extensions-nvim

		];

		extraConfig = (

			builtins.readFile ./init.vim
			+ builtins.readFile ./plugin-config/fzf.vim
			+ builtins.readFile ./plugin-config/goyo.vim
			+ builtins.readFile ./plugin-config/ledger.vim
			+ builtins.readFile ./plugin-config/neuron.vim
			+ builtins.readFile ./plugin-config/gruvbox.vim
			+ builtins.readFile ./plugin-config/vim-nix.vim
			+ builtins.readFile ./plugin-config/nerdtree.vim
			+ builtins.readFile ./plugin-config/lightline.vim
			+ builtins.readFile ./plugin-config/limelight.vim
			+ builtins.readFile ./plugin-config/vim-wheel.vim
			+ builtins.readFile ./plugin-config/easy-align.vim
			+ builtins.readFile ./plugin-config/delimitMate.vim
			+ builtins.readFile ./plugin-config/vim-fugitive.vim
			+ builtins.readFile ./plugin-config/vim-sayonara.vim
			# + builtins.readFile ./plugin-config/code-stats-vim.vim

			# rare
			# + builtins.readFile ./plugin-config/calendar.vim
			# + builtins.readFile ./plugin-config/vim-templates.vim

		);

	};

}
