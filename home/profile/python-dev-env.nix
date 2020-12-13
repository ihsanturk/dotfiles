{ pkgs, ... }:
{
	home.packages = with pkgs; [

		# python-language-server # not supported on darwin
		python38Packages.flake8
		python38Packages.pylint

	];

	programs.neovim = {
		plugins = with pkgs.vimPlugins; [

			ale
			# vim-cute-python

		];

		# extraConfig = (
		# 	builtins.readFile ../config/package/nvim/ale.vim
		# )

	};

}
