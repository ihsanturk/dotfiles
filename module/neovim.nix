{ config, pkgs, libs, ... }: {

	home.packages = with pkgs; [

		# clangd
		rnix-lsp
		neovim-remote
		neovim-nightly
		vimPlugins.packer-nvim

	];

	xdg.configFile."nvim/init.lua".source = ../config/neovim/init.lua;
	xdg.configFile."nvim/init.vim".source = ../config/neovim/init.vim;
	xdg.configFile."nvim/lua/plugins.lua".source = ../config/neovim/plugins.lua;
	xdg.configFile."nvim/config-plugins".source = ../config/neovim/config-plugin;

}

