{ pkgs, ... }:
{

	# nixpkgs.config.allowUnfree = true; # for discord
	gtk.theme.name = "Adwaita:dark";
	programs.firefox.enable = true;
	home.packages = with pkgs; [

		st
		feh
		surf
		dmenu
		mupdf
		xclip
		# scrot
		# pastel
		# discord
		# tdesktop # telegram

	];

	xdg.mimeApps = {
		enable = true;
		defaultApplications = let
			browser = "firefox.desktop";
		in {
			"text/html" = browser;
			"x-scheme-handler/http" = browser;
			"x-scheme-handler/https" = browser;
			"application/pdf" = "mupdf";
		};
	};

}
