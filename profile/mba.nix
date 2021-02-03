{ config, lib, pkgs, ... }: {

	# environment.systemPackages = with pkgs; [ neovim ];
	environment.variables.SHELL = "${pkgs.zsh}/bin/zsh";

	programs.zsh.enable = true;
	programs.zsh.promptInit = ""; # using starship.
	programs.zsh.enableSyntaxHighlighting = true;
	environment.shells = [ pkgs.zsh ];

	environment.etc = {
		"sudoers.d/10-nix-commands".text = let
			commands = [
				"/run/current-system/sw/bin/darwin-rebuild"
				"/run/current-system/sw/bin/nix*"
				"/run/current-system/sw/bin/ln"
				"/nix/store/*/activate"
				"/bin/launchctl"
			];
			commandsString = builtins.concatStringsSep ", " commands;
		in ''
%admin ALL=(ALL:ALL) NOPASSWD: ${commandsString}
		'';
	};

	nix.gc.user = "ihsan";
	nix.gc.automatic = true;
	nix.package = pkgs.nixFlakes; # NOTE: EXPERIMENTAL.
	nix.extraOptions =
		lib.optionalString (config.nix.package == pkgs.nixFlakes)
			"experimental-features = nix-command flakes";

	fonts = {
		enableFontDir = true;
		fonts = with pkgs; [ # quit from Font Book app
			(nerdfonts.override {fonts = ["FiraCode"];})
			# fira-code-symbols
			# nerd-fonts.firacode
		];
	};

	# nix.nixPath = [
	# 	"darwin-config=$HOME/.nixpkgs/darwin-configuration.nix"
	# 	"darwin=$HOME/.nix-defexpr/channels/darwin"
	# 	"$HOME/.nix-defexpr/channels"
	# ];

	# defaults
	system.defaults.dock.tilesize = 33;
	system.defaults.dock.show-recents = false;
	system.defaults.finder.QuitMenuItem = true;
	system.defaults.NSGlobalDomain.KeyRepeat = 1;
	system.defaults.NSGlobalDomain.InitialKeyRepeat = 10;
	system.defaults.NSGlobalDomain._HIHideMenuBar = false;
	system.defaults.finder._FXShowPosixPathInTitle = false;

	system.stateVersion = 4;
}
