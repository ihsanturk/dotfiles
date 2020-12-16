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
			# vim-cute-python

		];

		extraConfig = (
			builtins.readFile ../config/package/nvim/plugin-config/ale.vim
		);

	};

}
