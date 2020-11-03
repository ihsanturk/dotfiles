{ config, pkgs, lib, ... }:
let

	term = config.settings.terminal;
	customPlugins = import ./plugins.nix { inherit pkgs; };

in {

	programs.neovim = {
		enable = true;
		plugins = [

			customPlugins.v-vim
			customPlugins.twitvim
			customPlugins.info-vim
			customPlugins.vim-wheel
			customPlugins.neuron-vim
			customPlugins.vim-tureng
			customPlugins.tabline-vim
			customPlugins.vim-templates
			customPlugins.code-stats-vim
			customPlugins.vim-emacs-like
			customPlugins.vim-ihsensible
			customPlugins.vim-grave-navigation

			# ui
			pkgs.vimPlugins.nerdtree
			pkgs.vimPlugins.vim-devicons
			pkgs.vimPlugins.gruvbox-community
			# pkgs.vimPlugins.nerdtree-git-plugin

			pkgs.vimPlugins.fzf-vim
			pkgs.vimPlugins.vim-nix
			pkgs.vimPlugins.goyo-vim
			pkgs.vimPlugins.delimitMate
			pkgs.vimPlugins.targets-vim
			pkgs.vimPlugins.vim-fugitive
			pkgs.vimPlugins.vim-sayonara
			pkgs.vimPlugins.vim-sensible
			pkgs.vimPlugins.vim-surround
			pkgs.vimPlugins.limelight-vim
			pkgs.vimPlugins.vim-css-color
			pkgs.vimPlugins.vim-gitgutter
			pkgs.vimPlugins.vim-lastplace
			pkgs.vimPlugins.vim-commentary
			pkgs.vimPlugins.vim-nerdtree-syntax-highlight

			# rare
			# pkgs.vimPlugins.vim-ledger
			# pkgs.vimPlugins.calendar-vim

			# broken
			# pkgs.vimPlugins.lsp_extensions-nvim

		];

		viAlias = true;
		vimAlias = true;
		extraConfig = (

			builtins.readFile ./init.vim
			+ builtins.readFile ./plugin-config/fzf.vim
			+ builtins.readFile ./plugin-config/goyo.vim
			+ builtins.readFile ./plugin-config/neuron.vim
			+ builtins.readFile ./plugin-config/gruvbox.vim
			+ builtins.readFile ./plugin-config/vim-nix.vim
			+ builtins.readFile ./plugin-config/calendar.vim
			+ builtins.readFile ./plugin-config/nerdtree.vim
			+ builtins.readFile ./plugin-config/limelight.vim
			+ builtins.readFile ./plugin-config/vim-wheel.vim
			+ builtins.readFile ./plugin-config/delimitMate.vim
			+ builtins.readFile ./plugin-config/vim-fugitive.vim
			+ builtins.readFile ./plugin-config/vim-sayonara.vim
			+ builtins.readFile ./plugin-config/vim-templates.vim
			+ builtins.readFile ./plugin-config/code-stats-vim.vim

		);

	};

}
