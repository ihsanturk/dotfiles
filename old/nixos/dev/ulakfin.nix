{ config, pkgs, ... }:
{

	virtualisation.docker.enable = true;
	environment.systemPackages = with pkgs; [

		docker
		docker-compose
		python38Packages.ipython

	];

		# mongodb
		# vgo2nix
		# websocat
		# websocketd
		# mongodb-tools
		# sentencepiece
		# redis # in ../profile/server-linode.nix

	# ];

	# # Golang
	# programs.neovim.plugins = with pkgs.vimPlugins; [
	# 	# coc-go
	# 	# coc-nvim
	# 	vim-go
	# ];
	# programs.go = {
	# 	enable = true;
	# 	packages = {
	# 		# "github.com/ihsanturk/twitter-scraper" = builtins.fetchGit "https://github.com/ihsanturk/twitter-scraper";
	# 		"github.com/ihsanturk/redis/v8" = builtins.fetchGit "https://github.com/ihsanturk/redis";
	# 	};
	# 	goPath = "go";
	# 	# goBin = "${HOME}/go/bin";
	# };
	# programs.fish = {
	# 	shellInit = ''
	# 		set -gx PATH $GOBIN $PATH
	# 	'';
	# };

}
