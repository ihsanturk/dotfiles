{ config, lib, pkgs, ... }:
{
	programs.starship = {
		enable = true;
		enableBashIntegration = true;
		enableFishIntegration = true;
		enableZshIntegration = true;
	};
}
