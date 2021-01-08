{ pkgs, ... }:
{
	home.packages = with pkgs; [

		clippy

	];

	programs.neovim = {
		plugins = with pkgs.vimPlugins; [

			ale
			vim-toml

		];
	};

}
