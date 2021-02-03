{ pkgs, config, ... }:
{
	home.packages = with pkgs; [

		rustup # includes rls
		sccache
		# rust-analyzer

	];

	# programs.neovim = {
	# 	plugins = with pkgs.vimPlugins; [

	# 		# ale # using built in lsp
	# 		rust-vim
	# 		vim-toml

	# 	];
	# };

	# FIXME: can't access config.home from this file
	# config.home.sessionVariables.PATH = "$HOME/.cargo/bin:$PATH";

}
