{ config, lib, pkgs, ... }:
{
	programs.fzf = {

		enable = true;
		enableZshIntegration = true;
		enableBashIntegration = true;
		defaultCommand = "${pkgs.fd}/bin/fd -d6 --type f";
		defaultOptions = ["--ansi --height 50% --bind ctrl-k:kill-line"];

	};
}
