{ config, pkgs, libs, ... }: {

	home.packages = with pkgs; [

		neovim-remote
		neovim-nightly
		nodePackages_latest.vscode-html-languageserver-bin

		# sumneko-lua-language-server # FIXME: add overlay

	];

	xdg.configFile."nvim/init.lua".source = ../config/neovim/init.lua;
	xdg.configFile."nvim/lua/config".source = ../config/neovim/config;
	xdg.configFile."nvim/lua/plugins.lua".source = ../config/neovim/plugins.lua;

}

