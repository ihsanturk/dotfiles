{ pkgs, ... }:
{

	home.packages = with pkgs; [
		# nixFlakes
	];

	programs.fish = {
		shellInit = ''
			set -gx PATH /Users/ihsan/Library/Python/3.8/bin $PATH
		'';
	};

}
