{ config, lib, pkgs, ... }:
{
	services = {
		xserver = {

			layout = "gb";
			# xkbOptions = "eurosign:e";

			libinput = {
				enable = true;
				naturalScrolling = true;
			};

			desktopManager = {
				wallpaper.mode = "fill";
				xterm.enable = false;
				# gnome3.enable = true;
			};

			windowManager = {
				session = [{
					name = "dwm";
					start = ''
						${pkgs.dwm}/bin/dwm
					'';
				}];
				# xmonad = {
				# 	enable = true;
				# 	enableContribAndExtras = true;
				# };
			};

			autoRepeatDelay = 220;
			autoRepeatInterval = 20;
			displayManager = {
				defaultSession = "none+dwm"; #"none+xmonad"; #"gnome";
				setupCommands = ''
					${pkgs.slstatus}/bin/slstatus &
					${pkgs.feh}/bin/feh --bg-fill ~/Sync/image/wall/sunset.jpg &
				'';
				lightdm.greeters.gtk.theme.name = "dark";
			};

		};
	};
}
