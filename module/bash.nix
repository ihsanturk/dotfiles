{ config, lib, pkgs, ... }:
{

	programs.bash = {
		enable = true;
		initExtra = builtins.readFile ./function.sh;
	};

	# programs.neovim.extraConfig = "set shell=bash";

}
