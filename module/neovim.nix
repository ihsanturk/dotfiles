{ config, pkgs, libs, ... }: {

	home.packages = with pkgs; [

		# clangd
		rnix-lsp
		neovim-remote
		neovim-nightly
		vimPlugins.packer-nvim

	];

	xdg.configFile."nvim/init.lua".source = ../config/neovim/init.lua;
	xdg.configFile."nvim/lua/plugins.lua".source = ../config/neovim/plugins.lua;
	xdg.configFile."nvim/lua/config-plugins".source = ../config/neovim/config-plugin;

}

