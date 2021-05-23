{ config, lib, pkgs, ... }:
{

	accounts.email.accounts = {
		"ihsanl@protonmail.com" = {
			enable = true;
		};
	};

	programs.neomutt = {
		enable = true;
		# vimKeys = true;
	};

}


