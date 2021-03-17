{ pkgs, config, ... }:
{
	home.packages = with pkgs; [

		# rust-analyzer
		# sccache # not supported on darwin
		cargo-generate
		rustup # includes rls
		wasm-bindgen-cli
		wasm-pack

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
