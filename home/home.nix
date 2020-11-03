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
	home.sessionVariables.EDITOR = "nvim"; #FIXME:not working at with nix-darwin
	home.homeDirectory = /. + ("/home/" + config.home.username);

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
