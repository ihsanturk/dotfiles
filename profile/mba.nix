{ config, lib, pkgs, ... }: {

	# environment.systemPackages = with pkgs; [ neovim ];
	environment.variables.SHELL = "${pkgs.zsh}/bin/zsh";

	programs.zsh.enable = true;
	programs.zsh.enableFzfCompletion = true; # FIXME: not working
	programs.zsh.enableSyntaxHighlighting = true;
	programs.zsh.promptInit = ""; # using starship.
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

	# system.keyboard.keybindings."caps lock" = "ctrl + cmd + alt + shift";

	# services
	services.yabai = {
		enable = true;
		package = pkgs.yabai;
		config = {
			# layout = "bsp";
			top_padding    = 100;
			bottom_padding = 30;
			left_padding   = 30;
			right_padding  = 30;
			window_gap     = 30;
			# disableForApps = [
			# 	"System Preferences"
			# 	"Telegram"
			# 	"Spotify"
			# 	"ProtonVPN"
			# ];
		};
		# extraConfig = "yabai -m rule --add app='${item}' manage=off\n";
	};

	services.skhd = {
		enable = false;
		package = pkgs.skhd;
		skhdConfig = let
			modkey = /*caps lock*/ "cmd + ctrl + alt + shift"; # see: Karabiner
			prefix = "${pkgs.yabai}/bin/yabai -m";
		in ''
			${modkey} - j: ${prefix} window --focus next || ${prefix} window --focus "$((${prefix} query --spaces --display next || ${prefix} query --spaces --display first) |${pkgs.jq}/bin/jq -re '.[] | select(.visible == 1)."first-window"')" || ${prefix} display --focus next || ${prefix} display --focus first
			${modkey} - k: ${prefix} window --focus prev || ${prefix} window --focus "$((yabai -m query --spaces --display prev || ${prefix} query --spaces --display last) | ${pkgs.jq}/bin/jq -re '.[] | select(.visible == 1)."last-window"')" || ${prefix} display --focus prev || ${prefix} display --focus last
		'';
			# ${modkey} - c: center # TODO
			# ${modkey} - f: full screen # TODO
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
