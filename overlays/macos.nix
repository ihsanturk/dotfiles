{ config, lib, pkgs, ... }:
{

	# environment.systemPackages = with pkgs; [ neovim ];

	homebrew = {
		enable = true;
		cleanup = "zap";
		autoUpdate = true;
		brews = [

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

	# defaults
	system.defaults.NSGlobalDomain.InitialKeyRepeat = 10;
	system.defaults.NSGlobalDomain.KeyRepeat = 1;
	system.defaults.NSGlobalDomain._HIHideMenuBar = false;
	system.defaults.dock.show-recents = false;
	system.defaults.dock.tilesize = 33;
	system.defaults.finder.QuitMenuItem = true;
	system.defaults.finder._FXShowPosixPathInTitle = false;

	system.stateVersion = 4;
}
