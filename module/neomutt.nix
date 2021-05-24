{ config, lib, pkgs, ... }:
{

	programs.mbsync.enable = true;
	programs.msmtp.enable = true;

	accounts.email.maildirBasePath = "${config.home.homeDirectory}/Maildir";

	accounts.email.accounts.protonmail = rec {

		address = "ihsanl@protonmail.com";
		imap.host = "127.0.0.1";
		imap.port = 1143;
		passwordCommand = "pass proton-bridge";
		primary = true;
		realName = "ihsan";
		smtp.host = imap.host;
		smtp.port = 1025;
		userName = address;

		offlineimap.enable = true;
		neomutt.enable = true;
	};

	# accounts.email.accounts.gmail = {

	# 	address = "aliihsanturk@gmail.com";
	# 	flavor = "gmail.com";
	# 	passwordCommand = "pass google/aliihsanturk | head -1";
	# 	realName = "ihsan";
	# 	userName = "aliihsanturk@gmail.com";

	# 	offlineimap.enable = true;
	# 	neomutt.enable = true;
	# };


	programs.neomutt.enable = true;
	programs.neomutt.vimKeys = true;
	programs.neomutt.settings.imap_check_subscribed = "yes";

}


