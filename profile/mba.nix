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
		];
	};

	# services
	services.yabai = {
		enable = false;
		package = pkgs.yabai;
		config = {
			layout = "bsp";
			top_padding    = 30;
			bottom_padding = 30;
			left_padding   = 30;
			right_padding  = 30;
			window_gap     = 30;
		};
		extraConfig = ''
			yabai -m rule --add app='System Preferences' manage=off
			yabai -m rule --add app='Telegram' manage=off
		'';
	};

	services.skhd = {
		enable = false;
		package = pkgs.skhd;
		skhdConfig = let
			modkey = "cmd";
			prefix = "${pkgs.yabai}/bin/yabai -m";
			fstOrSnd = {fst, snd}: domain: "${prefix} ${domain} --focus ${fst} || ${prefix} ${domain} --focus ${snd}";
			nextOrFirst = fstOrSnd { fst = "next"; snd = "first";};
			prevOrLast = fstOrSnd { fst = "prev"; snd = "last";};
		in ''
			${modkey} - j: ${prefix} window --focus next || ${prefix} window --focus "$((${prefix} query --spaces --display next || ${prefix} query --spaces --display first) |${pkgs.jq}/bin/jq -re '.[] | select(.visible == 1)."first-window"')" || ${prefix} display --focus next || ${prefix} display --focus first
			${modkey} - k: ${prefix} window --focus prev || ${prefix} window --focus "$((yabai -m query --spaces --display prev || ${prefix} query --spaces --display last) | ${pkgs.jq}/bin/jq -re '.[] | select(.visible == 1)."last-window"')" || ${prefix} display --focus prev || ${prefix} display --focus last
			${modkey} + alt - j: ${prevOrLast "space"}
			${modkey} + alt - k: ${nextOrFirst "space"}
		'';
	};

	# defaults
	system.defaults.NSGlobalDomain.InitialKeyRepeat = 10;
	system.defaults.NSGlobalDomain.KeyRepeat = 1;
	system.defaults.NSGlobalDomain._HIHideMenuBar = true;
	system.defaults.dock.show-recents = false;
	system.defaults.dock.tilesize = 33;
	system.defaults.finder.QuitMenuItem = true;
	system.defaults.finder._FXShowPosixPathInTitle = false;

	environment.etc = {

		# Not working becuase the file already exists and if I move it then I
		# can't update the system because I can't use sudo! :/
# 		"pam.d/sudo".text = ''
# # sudo: auth account password session
# auth       sufficient     pam_tid.so
# auth       sufficient     pam_smartcard.so
# auth       required       pam_opendirectory.so
# account    required       pam_permit.so
# password   required       pam_deny.so
# session    required       pam_permit.so
# 		'';

# 		"sudoers.d/10-nix-commands".text = let
# 			commands = [
# 				"/run/current-system/sw/bin/darwin-rebuild"
# 				"/run/current-system/sw/bin/nix*"
# 				"/run/current-system/sw/bin/ln"
# 				"/nix/store/*/activate"
# 				"/bin/launchctl"
# 			];
# 			commandsString = builtins.concatStringsSep ", " commands;
# 		in ''
# %admin ALL=(ALL:ALL) NOPASSWD: ${commandsString}
# 		'';

	};

	system.stateVersion = 4;
}
