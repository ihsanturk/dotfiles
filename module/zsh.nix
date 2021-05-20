{ config, lib, pkgs, ... }:
let
	shellAliases = import ./shell-aliases.nix;
in {
	programs.zsh = {
		enable = true;

		defaultKeymap = "emacs";
		enableAutosuggestions = true; # shadow completion
		enableCompletion = false;     # added in ./zshinit.sh manually
		inherit shellAliases;
		prezto.enable = true;
		prezto.prompt.theme = "pure";
		prezto.pmodules = [ "prompt" ];

		initExtra = builtins.readFile ./zshinit.sh
		          + builtins.readFile ./sh-init.sh;
	};

}

