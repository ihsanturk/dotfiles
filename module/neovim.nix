{ config, pkgs, libs, ... }: {

	home.packages = with pkgs; [
		rnix-lsp
		neovim-nightly
		vimPlugins.packer-nvim
	];

	xdg.configFile."nvim/init.lua".source = ../config/neovim/init.lua;

}

