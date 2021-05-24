{ config, lib, pkgs, ... }:
{

	accounts.email.accounts.protonmail = rec {

		address = "ihsanl@protonmail.com";
		imap.host = "127.0.0.1";
		imap.port = 1143;
		neomutt.enable = true;
		passwordCommand = "pass proton-bridge";
		primary = true;
		realName = "ihsan";
		smtp.host = "127.0.0.1";
		smtp.port = 1025;
		userName = address;

	};

	accounts.email.accounts.gmail = {

		address = "aliihsanturk@gmail.com";
		flavor = "gmail.com";
		neomutt.enable = true;
		passwordCommand = "pass google";
		realName = "ihsan";
		userName = "aliihsanturk@gmail.com";

	};


	programs.neomutt.enable = true;
	programs.neomutt.vimKeys = true;
	programs.neomutt.settings.imap_check_subscribed = "yes";

}


