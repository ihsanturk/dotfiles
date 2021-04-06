{ pkgs, ... }:
{
	home.packages = with pkgs; [

		# valgrind # broken :/
		# clang_10
		# llvmPackages.clang-unwrapped

	];

	# programs.neovim = {
	# 	plugins = with pkgs.vimPlugins; [
	# 		custom.valgrind-vim
	# 	];
	# };

}
