{ config, lib, pkgs, ... }: {

	home.packages = with pkgs; [ h ];

	programs.zsh = {
		initExtra = ''eval "$(h --setup $DIR_CODE)"'';
	};

	programs.bash = {
		initExtra = ''eval "$(h --setup $DIR_CODE)"'';
	};

}
