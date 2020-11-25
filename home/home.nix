{ config, lib, ... }:
let

	# config
	isGraphical = true;

	# utilities
	util = import ./util lib;
	optionals = lib.optionals;
	os = builtins.currentSystem;
	isLinux = os == "x86_64-linux";
	isDarwin = os == "x86_64-darwin";

in rec {

	home.username = "ihsan";
	programs.home-manager.enable = true;
	home.homeDirectory = if isDarwin then
		/. + ("/Users/" + config.home.username)
	else /. + ("/home/" + config.home.username);
	home.sessionVariables = { #FIXME:not working at with nix-darwin
		EDITOR = "nvim";
		GPG_TTY = "$(tty)";
		PATH = "$HOME/Sync/bin:$PATH";
		CODESTATS_API_KEY = "${config.private.codeStatsAPIKey}";
		GCALAPI = "${config.private.googleCalendarApiKey}";
		GCALSECRET = "${config.private.googleCalendarSecret}";
		GCALCLIENTID = "${config.private.googleCalendarClientId}";
	};

	nixpkgs.overlays = [
		(import ./overlay)
		(import ./overlay/st)
	];
	
	nixpkgs.config.trustedUsers = [
		config.home.username
		(optionals isLinux [ "root" ])
	];

	imports = [
		./module
		./profile/base.nix
		# ./profile/tmp.nix # beta softwares (dd if things broke)
		# ./profile/impure.nix # beta softwares (dd if things broke)
	]
		++ (import ./config util)
		++ (optionals isDarwin [ ./profile/darwin.nix ])
		++ (optionals isGraphical [ ./profile/base-graphical.nix ])
		++ (optionals (isGraphical && isLinux) [./profile/linux-graphical.nix]);

}
