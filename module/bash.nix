{ config, lib, pkgs, ... }:
let

	shellAliases = import ./shell-aliases.nix config;

in {

	programs.bash = {
		enable = false;
		inherit shellAliases;
		initExtra = builtins.readFile ./function.sh;
	};

	programs.neovim.extraConfig = "set shell=bash";

}
