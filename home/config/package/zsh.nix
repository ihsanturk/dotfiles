{ config, lib, pkgs, ... }:
let

	if_ = lib.optionalString;
	zshEnabledThen = config.programs.zsh.enable;
	shellAliases = import ../shell-aliases.nix config;

in {

	# TODO: SEE: ~/.nixpkgs/darwin-configuration.nix
	programs.zsh = {
		inherit shellAliases;
		defaultKeymap = "emacs";
		enableAutosuggestions = true;
		enableCompletion = true;
		# TODO: change this
		initExtra = "
			autoload -U select-word-style
			select-word-style bash
			zstyle ':completion:*' completer _complete
			zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
			autoload -Uz compinit && compinit
		" + builtins.readFile ./function.sh;
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
