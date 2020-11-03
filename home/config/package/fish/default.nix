{ config, lib, pkgs, ... }:
let

	if_ = lib.optionalString;
	functions = import ./fish-functions.nix;
	fishEnabledThen = config.programs.fish.enable;
	codeStatsAPIKey = config.private.codeStatsAPIKey;
	shellAliases = import ../../shell-aliases.nix config;

	# {
	# 	conf = "$EDITOR (find ~/dot/ -type f | ${pkgs.fzf}/bin/fzf)";
	# }

in {

	programs.fish = {
		inherit shellAliases;
		inherit functions;
		shellInit = ''
			set fish_greeting
			set -gx PATH $HOME/Sync/bin $PATH
			set -gx CODESTATS_API_KEY ${codeStatsAPIKey};
			status --is-interactive; and source (jump shell fish | psub)
		'';
	};

	programs.neovim.extraConfig = if_ fishEnabledThen "set shell=fish";

}
