{ config, pkgs, libs, ... }: {

	home.packages = with pkgs; [

		# clangd
		# vimPlugins.packer-nvim

		rnix-lsp
		neovim-remote
		neovim-nightly

		# lua51Packages.lua-lsp
		luajitPackages.lua-lsp

	];

	xdg.configFile."nvim/init.lua".source = ../config/neovim/init.lua;
	xdg.configFile."nvim/lua/config".source = ../config/neovim/config;
	xdg.configFile."nvim/lua/plugins.lua".source = ../config/neovim/plugins.lua;

}

