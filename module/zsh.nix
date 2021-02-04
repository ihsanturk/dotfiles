{ config, lib, pkgs, ... }:
let

	shellAliases = import ./shell-aliases.nix config;

in {

	# TODO: SEE: ~/.nixpkgs/darwin-configuration.nix
	programs.zsh = {
		enable = true;
		inherit shellAliases;
		defaultKeymap = "emacs";
		enableCompletion = false;
		enableAutosuggestions = true;
		initExtra = builtins.readFile ./zshinit.sh
		          + builtins.readFile ./function.sh;
	};

	programs.neovim.extraConfig = "set shell=zsh";

	home.packages = with pkgs; [
		zsh-history-substring-search
	];

}
