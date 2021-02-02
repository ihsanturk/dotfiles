{ config, lib, pkgs, ... }:
{

	programs.firefox = {

		enable = true;
		profiles = {
			default = {
				isDefault = true;
				settings = {

					"geo.enabled" = false;
					"devtools.theme" = "dark";
					"browser.search.region" = "GB";
					"browser.display.background_color" = "#282828"; # config.setting.color.bg; # TODO
					"browser.display.foreground_color" = "#eeeeee"; # config.setting.color.fg; # TODO
					"browser.sessionstore.resume_session_once" = true;
					"toolkit.legacyUserProfileCustomizations.stylesheets" = true;
					"browser.search.hiddenOneOffs" = "Yahoo,Bing,Amazon.com,Twitter";

				};
				userChrome = builtins.readFile ./userchrome.css;
				userContent = builtins.readFile ./usercontent.css;
			};
		};
	};

}
