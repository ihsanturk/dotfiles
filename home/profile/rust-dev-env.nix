{ pkgs, ... }:
{
	home.packages = with pkgs; [

		rustup
		sccache
		rust-analyzer

	];

	programs.neovim = {
		plugins = with pkgs.vimPlugins; [

			ale
			rust-vim
			vim-toml

		];
	};

}
