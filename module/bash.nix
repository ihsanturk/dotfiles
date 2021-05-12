{ config, lib, pkgs, ... }:
{

	programs.bash = {
		enable = true;
		initExtra = builtins.readFile ./function.sh
		          + builtins.readFile ./sh-init.sh;
	};

	# programs.neovim.extraConfig = "set shell=bash";

}
