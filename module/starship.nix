{ config, lib, pkgs, ... }:
{
	programs.starship = {
		enable = true;
		enableBashIntegration = true;
		enableFishIntegration = true;
		enableZshIntegration = true;
		settings = {
			scan_timeout = 0.1;
			command_timeout = 0.1;
		}
	};
}
