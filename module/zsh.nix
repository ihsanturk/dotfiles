{ config, lib, pkgs, ... }:
let

	shellAliases = import ./shell-aliases.nix config;

in {

	programs.zsh = {
		enable = true;
		inherit shellAliases;
		defaultKeymap = "emacs";
		enableCompletion = false;     # added in ./zshinit.sh manually
		enableAutosuggestions = true; # shadow completion
		initExtra = builtins.readFile ./instant-zsh.zsh
		          + builtins.readFile ./function.sh
		          + builtins.readFile ./zshinit.sh;
	};

	programs.neovim.extraConfig = "set shell=zsh";

	# home.packages = with pkgs; [
	# 	zsh-history-substring-search
	# ];

}
