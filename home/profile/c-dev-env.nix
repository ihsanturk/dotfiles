{ pkgs, ... }:
let
	custom = import ../config/package/nvim/plugins.nix { inherit pkgs; };
in {
	home.packages = with pkgs; [

		# valgrind # broken :/

	];

	programs.neovim = {
		plugins = with pkgs.vimPlugins; [

			custom.valgrind-vim

		];
	};

}
