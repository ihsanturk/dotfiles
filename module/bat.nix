{ config, lib, pkgs, ... }:
let
	if_ = lib.optionalString;
	zshEnabledThen = config.programs.zsh.enable;
	fishEnabledThen = config.programs.fish.enable;
in {

	programs.bat = {

		enable = true;
		config.theme = "base16";
		# paging = "never";

	};
	
	programs.fish.shellAliases = if_ fishEnabledThen { cat = "bat"; };
	programs.zsh.shellAliases =  if_ zshEnabledThen { cat = "bat"; };
	home.sessionVariables = {
		MANPAGER = "sh -c 'col -bx | ${pkgs.bat}/bin/bat --paging=always -l man -p'";
		MANROFFOPT = "-c";
	};

}
