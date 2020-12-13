{ pkgs, ... }:
{
	home.packages = with pkgs; [

		ghc
		hlint

	];

	programs.neovim = {
		plugins = with pkgs.vimPlugins; [

			hlint-refactor-vim

		];
	};

}
