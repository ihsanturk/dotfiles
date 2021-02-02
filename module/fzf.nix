{ config, lib, pkgs, ... }:
{
	programs.fzf = {

		defaultCommand = "${pkgs.fd}/bin/fd -d6 --type f";
		defaultOptions = ["--ansi --height 50% --bind ctrl-k:kill-line"];

	};
}
