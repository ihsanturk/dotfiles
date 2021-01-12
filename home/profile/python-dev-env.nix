{ pkgs, ... }:
{
	home.packages = with pkgs; [

		# mypy
		python38Packages.flake8
		# python-language-server # not supported on darwin

	];

	programs.neovim = {
		plugins = with pkgs.vimPlugins; [

			ale
			# vim-cute-python # I didn't like that.

		];

		extraConfig = (
			builtins.readFile ../config/package/nvim/plugin-config/ale.vim
		);

	};

	# FIXME: can't access config.home from this file
	# home.sessionVariables.PATH = "$HOME/Library/Python/3.8/bin$PATH";

}
