{ config, lib, pkgs, ... }:
let

	# if_ = lib.optionalString;
	# fishEnabledThen = config.programs.fish.enable;

	functions = import ./fish-functions.nix;
	shellAliases = import ../../shell-aliases.nix config;
	# codeStatsAPIKey = config.private.codeStatsAPIKey;

	# {
	# 	conf = "$EDITOR (find ~/dot/ -type f | ${pkgs.fzf}/bin/fzf)";
	# }

in {

	programs.fish = {
		enable = true;
		inherit shellAliases;
		inherit functions;
		shellInit = ''
			set fish_greeting
			status --is-interactive; and source (jump shell fish | psub)
		'';
	};

	# programs.neovim.extraConfig = if_ fishEnabledThen "set shell=fish";
	programs.neovim.extraConfig = "set shell=fish";

}
