{ config, lib, pkgs, ... }:
{

	programs.bash = {
		enable = true;
		initExtra = builtins.readFile ./bash-init.sh
		          + builtins.readFile ./sh-init.sh;
	};

	# programs.neovim.extraConfig = "set shell=bash";

}
