{ pkgs, ... }:
{
	home.packages = with pkgs; [

		rustup
		clippy

	];

	programs.neovim = {
		plugins = with pkgs.vimPlugins; [

			ale
			vim-toml

		];
	};

}
