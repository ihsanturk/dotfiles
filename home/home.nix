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
		ftx_API_KEY = "${config.private.ftxApiKey}";
		ftx_SEC_KEY = "${config.private.ftxSecKey}";
		PATH = "$HOME/Sync/bin:$HOME/.cargo/bin:$PATH";
		GCALAPI = "${config.private.googleCalendarApiKey}";
		BINANCE_API_KEY = "${config.private.binanceApiKey}";
		BINANCE_SEC_KEY = "${config.private.binanceSecKey}";
		GCALSECRET = "${config.private.googleCalendarSecret}";
		DIR_LEARN = "$HOME/Sync/code/github.com/ihsanturk/learn";
		# CODESTATS_API_KEY = "${config.private.codeStatsAPIKey}";
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
		# ./profile/c-dev-env.nix
		./profile/rust-dev-env.nix
		./profile/python-dev-env.nix
		./profile/haskell-dev-env.nix
		# ./profile/tmp.nix # beta softwares (dd if things broke)
		# ./profile/impure.nix # beta softwares (dd if things broke)
	]
		++ (import ./config util)
		++ (optionals isDarwin [ ./profile/darwin.nix ])
		++ (optionals isGraphical [ ./profile/base-graphical.nix ])
		++ (optionals (isGraphical && isLinux) [./profile/linux-graphical.nix]);

}
