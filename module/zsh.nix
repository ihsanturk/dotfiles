{ config, lib, pkgs, ... }:
let

	shellAliases = import ./shell-aliases.nix config;

in {

	# TODO: SEE: ~/.nixpkgs/darwin-configuration.nix
	programs.zsh = {
		inherit shellAliases;
		defaultKeymap = "emacs";
		enableCompletion = false;
		enableAutosuggestions = true;
		initExtra = builtins.readFile ./zshinit.sh
		          + builtins.readFile ./function.sh;
		# plugins = [
		# 	{
		# 		name = "code-stats";
		# 		src = builtins.fetchGit
		# 			"https://gitlab.com/code-stats/code-stats-zsh";
		# 	}
		# ];
	};

	programs.neovim.extraConfig = "set shell=zsh";

	home.packages = with pkgs; [
		zsh-history-substring-search
	];

}
