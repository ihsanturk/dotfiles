{ pkgs, ... }:
{
	home.packages = with pkgs; [

		rustup
		rust-analyzer

	];

	programs.neovim = {
		plugins = with pkgs.vimPlugins; [

			ale
			vim-toml

		];
	};

}
