{ config, lib, pkgs, ... }:
{
	programs.starship = {
		enable = true;
		enableBashIntegration = true;
		enableFishIntegration = true;
		enableZshIntegration = true;
		settings = {
			scan_timeout = 10; # milliseconds
			command_timeout = 50; # milliseconds
		};
	};
}
