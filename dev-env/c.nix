{ pkgs, ... }:
{
	home.packages = with pkgs; [

		# valgrind # broken :/

	];

	# programs.neovim = {
	# 	plugins = with pkgs.vimPlugins; [
	# 		custom.valgrind-vim
	# 	];
	# };

}
