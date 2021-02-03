{ pkgs, ... }:
{
	home.packages = with pkgs; [

		# mypy
		# python38Packages.flake8
		python38Packages.ipython
		python38Packages.python-language-server

	];

	# programs.neovim = {
	# 	plugins = with pkgs.vimPlugins; [
	# 		# ale
	# 		# coc
	# 		# vim-cute-python # I didn't like that.
	# 	];
	# 	extraConfig = (
	# 		builtins.readFile ../config/package/nvim/plugin-config/ale.vim
	# 	);
	# };

	# FIXME: can't access config.home from this file
	# home.sessionVariables.PATH = "$HOME/Library/Python/3.8/bin$PATH";

}
