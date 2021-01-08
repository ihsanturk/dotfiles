{ config, lib, pkgs, ... }:
{

	# # home-manager
	# imports = [
	# 	(import "${builtins.fetchTarball
	# 	https://github.com/rycee/home-manager/archive/master.tar.gz}/nix-darwin")
	# ];

	# programs.fish.enable = true;
	programs.zsh.enable = true;
	programs.zsh.enableSyntaxHighlighting = true;
	environment.shells = [ pkgs.fish pkgs.zsh ];
	environment.systemPackages = with pkgs; [

		qemu
		docker
		# direnv
		# tdesktop # telegram

	];

	# auto upgrade & gc
	nix.gc.user = "ihsan";

	nix.package = pkgs.nixFlakes; # NOTE: EXPERIMENTAL.
	nix.extraOptions = lib.optionalString (config.nix.package == pkgs.nixFlakes)
		"experimental-features = nix-command flakes";

	nix.nixPath = [
		"darwin-config=$HOME/.nixpkgs/darwin-configuration.nix"
		"darwin=$HOME/.nix-defexpr/channels/darwin"
		"$HOME/.nix-defexpr/channels"
	];

	nixpkgs.overlays = import ./overlay;

	fonts = {
		enableFontDir = true;
		fonts = with pkgs; [ # quit from font book app
			fira-code-symbols
			nerd-fonts.firacode
		];
	};

	# TODO: vip
	# launchd.user.agents.binancesync = {
	# 	command = "while true; date >> /tmp/x.log; sleep 10; done";
	# 	serviceConfig.KeepAlive = true;
	# };

	# TODO: vip
	# services.cron = {
	# 	enable = true;
	# 	systemCronJobs = [
	# 		"*/1 * * * *      root    date >> /tmp/cron.log"
	# 	];
	# };

	# services
	# services.lorri.enable = true;
	# services.emacs.enable = true;

	# defaults
	system.defaults.dock.tilesize = 33;
	system.defaults.dock.show-recents = false;
	system.defaults.finder.QuitMenuItem = true;
	system.defaults.NSGlobalDomain.KeyRepeat = 1;
	system.defaults.NSGlobalDomain.InitialKeyRepeat = 10;
	system.defaults.NSGlobalDomain._HIHideMenuBar = false;
	system.defaults.finder._FXShowPosixPathInTitle = false; # full path on finder

	system.stateVersion = 4;

}
