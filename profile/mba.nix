{ config, lib, pkgs, ... }: {

	# environment.systemPackages = with pkgs; [ neovim ];

	programs.bash.enable = true;
	programs.zsh.enable = false;
	programs.zsh.enableSyntaxHighlighting = true;
	programs.zsh.promptInit = ""; # using starship.

	environment.shells = [ pkgs.bash pkgs.zsh ];
	environment.variables.SHELL = "${pkgs.bash}/bin/bash";

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
		enable = true;
		package = pkgs.yabai;
		enableScriptingAddition = true;
		config = {
			top_padding    = 40;
			bottom_padding = 40;
			left_padding   = 40;
			right_padding  = 40;
			window_gap     = 24;
			mouse_action1  = "move";
			# layout = "bsp";
			# disableForApps = [ # NOTE: Not implemented
			# 	"Logic Pro"
			# 	"ProtonVPN"
			# 	"Spotify"
			# 	"System Preferences"
			# 	"Telegram"
			# 	"Messages"
			# ];
		};
		# extraConfig = "yabai -m rule --add app='${item}' manage=off\n";
	};

	services.skhd = {
		enable = true;
		package = pkgs.skhd;
		skhdConfig = let
			modkey = /*caps lock*/ "cmd + ctrl + alt + shift"; # see: Karabiner
			prefix = "${pkgs.yabai}/bin/yabai -m";
			d = "$(${prefix} query --displays --display)";
			w = "$(${prefix} query --windows --window)";
			dw = "$(echo ${d}|jq '.frame.w')"; dh = "$(echo ${d}|jq '.frame.h')";
			wx = "$(echo ${w}|jq '.frame.x')"; wy = "$(echo ${w}|jq '.frame.y')";
			ww = "$(echo ${w}|jq '.frame.w')"; wh = "$(echo ${w}|jq '.frame.h')";
			distanceToCenterX = "$((-(${wx} - ((${dw}/2) - (${ww}/2)))))";
			distanceToCenterY = "$((-(${wy} - ((${dh}/2) - (${wh}/2)))))";
		in ''
			${modkey} - c: ${prefix} window --toggle float; ${prefix} window --move rel:${distanceToCenterX}:${distanceToCenterY};
			${modkey} - f: ${prefix} window --toggle float; ${prefix} window --grid 1:1:0:0:1:1;

			${modkey} - j: ${prefix} window --toggle float; ${prefix} window --grid 2:1:2:1:1:1;
			${modkey} - k: ${prefix} window --toggle float; ${prefix} window --grid 2:1:1:0:1:1;
			${modkey} - l: ${prefix} window --toggle float; ${prefix} window --grid 1:2:1:2:1:1;
			${modkey} - h: ${prefix} window --toggle float; ${prefix} window --grid 1:2:0:1:1:1;

			${modkey} - return: open -a Alacritty;
			${modkey} - w: open -a Safari;
			${modkey} - s: open -a Spotify;
			${modkey} - a: open -a Authy\ Desktop;
			${modkey} - m: open -a Mail;
			${modkey} - t: open -a Telegram;
			${modkey} - g: open -a Calendar;
			${modkey} - b: open -a Bitwarden;
		'';
	};

	# defaults
	system.defaults.NSGlobalDomain.InitialKeyRepeat = 10;
	system.defaults.NSGlobalDomain.KeyRepeat = 1;
	system.defaults.NSGlobalDomain._HIHideMenuBar = false;
	system.defaults.dock.show-recents = false;
	system.defaults.dock.tilesize = 33;
	system.defaults.finder.QuitMenuItem = true;
	system.defaults.finder._FXShowPosixPathInTitle = false;

	environment.etc = {

		# NOTE: Not working becuase the file already exists and if I move it then
		# I can't update the system because I can't use sudo! :/
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
