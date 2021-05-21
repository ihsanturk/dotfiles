{ config, lib, pkgs, ... }:
{

	# environment.systemPackages = with pkgs; [ neovim ];

	# sysctl -n hw.ncpu
	nix.buildCores = 4;
	nix.maxJobs = 4;

	homebrew = {
		enable = true;
		cleanup = "zap";
		autoUpdate = true;
		brews = [

			"valgrind"    # dynamic analysis tools (memory, debug, profiling)
			"clisp"       # lisp interpreter
			"ripgrep-all" # ripgrep for pdf and other file formats
			"tcc"         # tiny c compiler
			"vlang"       # v compiler

		];
		casks = [

			"alacritty"             # suckless minimal terminal
			"authy"                 # replacement for google authenticator
			"imageoptim"            # image optimizer
			"sketchbook"            # drawing app
			"karabiner-elements"    # key binder / remap tool
			"protonvpn"             # vpn
			"qlstephen"             # show unknown formats as text in quick look
			"refined-github-safari" # "better" github safari extension
			"slack"                 # communication/chat app
			"spotify"               # music streaming
			"zoom"                  # conversations / video calls

		];

		# masApps = {
		# 	Telegram =
		# 	Keynote =
		# 	GarageBand =
		# 	iMovie =
		# 	Xcode =
		# 	Numbers =
		# 	Pages =
		# 	Vimari (Safari Extension) =
		# };

	};

	programs.zsh.enable = true;
	programs.zsh.enableSyntaxHighlighting = true;
	programs.zsh.enableCompletion = false; # fuck you slow startup
	programs.zsh.promptInit = ""; # using starship.
	programs.bash.enable = true;
	programs.bash.enableCompletion = true;

	environment.etc."inputrc" = {
		text = pkgs.lib.mkDefault(pkgs.lib.mkAfter ''
			set visible-stats On
			set colored-stats On
			set completion-ignore-case on
			set completion-prefix-display-length 2
			set show-all-if-ambiguous on
			set show-all-if-unmodified on
			set completion-map-case on
		'');
	};

	environment.loginShell = "zsh";
	environment.shellAliases = import ../module/shell-aliases.nix;
	environment.shells = [ pkgs.zsh pkgs.bash ];
	environment.variables.SHELL = config.environment.loginShell;

	users.nix.configureBuildUsers = true;

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
		};
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

			${modkey} - j: ${prefix} space --focus next
			${modkey} - k: ${prefix} space --focus prev
			${modkey} - o: ${prefix} space --focus recent

			${modkey} - l: ${prefix} window --toggle float; ${prefix} window --grid 1:2:1:2:1:1;
			${modkey} - h: ${prefix} window --toggle float; ${prefix} window --grid 1:2:0:1:1:1;

			${modkey} - space: /Users/ihsan/bin/app-launcher;
			${modkey} - return: open -a Alacritty;
			${modkey} - w: open -a Safari;
			${modkey} - a: open -a Authy\ Desktop;
			${modkey} - m: open -a Mail;
			${modkey} - t: open -a Telegram;
			${modkey} - g: open -a Calendar;

		'';
	};

	# defaults
	system.defaults.NSGlobalDomain.InitialKeyRepeat = 15;
	system.defaults.NSGlobalDomain.KeyRepeat = 2;
	system.defaults.NSGlobalDomain._HIHideMenuBar = false;
	system.defaults.dock.show-recents = false;
	system.defaults.dock.tilesize = 33;
	system.defaults.finder.QuitMenuItem = true;
	system.defaults.finder._FXShowPosixPathInTitle = false;

	system.stateVersion = 4;
}
