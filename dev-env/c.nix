{ pkgs, ... }:
{
	home.packages = with pkgs; [

		# valgrind # broken :/
		clang-unwrapped

	];

	# programs.neovim = {
	# 	plugins = with pkgs.vimPlugins; [
	# 		custom.valgrind-vim
	# 	];
	# };

}
