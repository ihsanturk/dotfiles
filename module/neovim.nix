{ config, pkgs, libs, ... }: {

	home.packages = with pkgs; [
		rnix-lsp
		neovim-remote
		neovim-nightly
		vimPlugins.packer-nvim
	];

	xdg.configFile."nvim/init.lua".source = ../config/neovim/init.lua;
	xdg.configFile."nvim/lua/plugins.lua".source = ../config/neovim/plugins.lua;

}

