{ config, lib, pkgs, ... }:
let

	if_ = lib.optionalString;
	zshEnabledThen = config.programs.zsh.enable;
	shellAliases = import ../shell-aliases.nix pkgs;

in {

	# TODO: SEE: ~/.nixpkgs/darwin-configuration.nix
	programs.zsh = {
		inherit shellAliases;
		defaultKeymap = "emacs";
		enableAutosuggestions = true;
		enableCompletion = true;
		# TODO: change this
		initExtra = ''
			export PATH=$HOME/Sync/bin:$PATH
			export CODESTATS_API_KEY=${config.private.codeStatsAPIKey};
			export GCALAPI=${config.private.googleCalendarApiKey};
			export GCALSECRET=${config.private.googleCalendarSecret};
			export GCALCLIENTID=${config.private.googleCalendarClientId};
			# delete word by word
			autoload -U select-word-style
			autoload -Uz compinit && compinit
			select-word-style bash
		'';
		plugins = [
			{
				name = "code-stats";
				src = builtins.fetchGit "https://gitlab.com/code-stats/code-stats-zsh";
			}
		];
	};

	programs.neovim.extraConfig = if_ zshEnabledThen "set shell=zsh";

	home.packages = with pkgs; if_ zshEnabledThen [
		zsh-history-substring-search
	];

}
