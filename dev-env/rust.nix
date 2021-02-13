{ pkgs, config, ... }:
{
	home.packages = with pkgs; [

		cargo-generate
		rust-analyzer
		rustup # includes rls
		sccache
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
