{ config, lib, pkgs, ... }: {

	# environment.systemPackages = with pkgs; [ neovim ];
	environment.variables.SHELL = "${pkgs.zsh}/bin/zsh";

	programs.zsh.enable = true;
	programs.zsh.promptInit = ""; # using starship.
	programs.zsh.enableSyntaxHighlighting = true;
	environment.shells = [ pkgs.zsh ];

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

	# services
	services.yabai = {
		enable = true;
		package = pkgs.yabai;
		config = {
			top_padding    = 40;
			bottom_padding = 30;
			left_padding   = 30;
			right_padding  = 30;
			window_gap     = 30;
		};
		extraConfig = ''
			yabai -m rule --add app='System Preferences' manage=off
		'';
	};

	# defaults
	system.defaults.dock.tilesize = 33;
	system.defaults.dock.show-recents = false;
	system.defaults.finder.QuitMenuItem = true;
	system.defaults.NSGlobalDomain.KeyRepeat = 1;
	system.defaults.NSGlobalDomain.InitialKeyRepeat = 10;
	system.defaults.NSGlobalDomain._HIHideMenuBar = false;
	system.defaults.finder._FXShowPosixPathInTitle = false;

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

	system.stateVersion = 4;
}
