{ config, pkgs, lib, ... }:
let

	term = config.settings.terminal;
	customPlugins = import ./plugins.nix { inherit pkgs; };

in {

	programs.neovim = {
		enable = true;
		plugins = with pkgs.vimPlugins; [

			customPlugins.v-vim
			customPlugins.info-vim
			customPlugins.ihlog-vim
			customPlugins.vim-wheel
			customPlugins.neuron-vim
			customPlugins.vim-tureng
			customPlugins.tabline-vim
			customPlugins.code-stats-vim
			customPlugins.vim-emacs-like
			customPlugins.vim-ihsensible
			customPlugins.vim-searchlight
			customPlugins.vim-you-autocorrect
			customPlugins.vim-grave-navigation

			# ui
			nerdtree
			vim-devicons
			gruvbox-community
			# vim-cute-python
			# nerdtree-git-plugin

			ale
			fzf-vim
			vim-nix
			goyo-vim
			vim-ledger
			delimitMate
			targets-vim
			vim-fugitive
			vim-sayonara
			vim-sensible
			vim-surround
			limelight-vim
			vim-css-color
			vim-gitgutter
			vim-lastplace
			vim-commentary
			vim-easy-align
			vim-nerdtree-syntax-highlight

			# rare
			# vim-ledger
			# calendar-vim
			# customPlugins.twitvim
			# customPlugins.vim-templates

			# broken
			# lsp_extensions-nvim

		];

		viAlias = false;
		vimAlias = true;
		extraConfig = (

			builtins.readFile ./init.vim
			+ builtins.readFile ./plugin-config/fzf.vim
			+ builtins.readFile ./plugin-config/goyo.vim
			+ builtins.readFile ./plugin-config/neuron.vim
			+ builtins.readFile ./plugin-config/gruvbox.vim
			+ builtins.readFile ./plugin-config/vim-nix.vim
			# + builtins.readFile ./plugin-config/calendar.vim
			+ builtins.readFile ./plugin-config/nerdtree.vim
			+ builtins.readFile ./plugin-config/limelight.vim
			+ builtins.readFile ./plugin-config/vim-wheel.vim
			+ builtins.readFile ./plugin-config/easy-align.vim
			+ builtins.readFile ./plugin-config/delimitMate.vim
			+ builtins.readFile ./plugin-config/vim-fugitive.vim
			+ builtins.readFile ./plugin-config/vim-sayonara.vim
			+ builtins.readFile ./plugin-config/code-stats-vim.vim
			# + builtins.readFile ./plugin-config/vim-templates.vim

		);

	};

}
