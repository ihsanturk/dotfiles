{ config, pkgs, libs, ... }: {

	home.packages = with pkgs; [

		luajitPackages.ldoc # lua documentation tool
		neovim-nightly      # beta versions of neovim
		neovim-remote       # remote acces to neovim
		nodePackages_latest.vscode-html-languageserver-bin # html lsp

		# sumneko-lua-language-server # FIXME: add custom overlay

	];

	xdg.configFile."nvim/init.lua".source = ../config/neovim/init.lua;
	xdg.configFile."nvim/lua/config".source = ../config/neovim/config;
	xdg.configFile."nvim/lua/script".source = ../config/neovim/script;
	xdg.configFile."nvim/lua/custom".source = ../config/neovim/custom;
	xdg.configFile."nvim/lua/plugins.lua".source = ../config/neovim/plugins.lua;

}

