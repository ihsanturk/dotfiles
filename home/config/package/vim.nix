{ pkgs, ... }:
{
	programs.vim = {
		plugins = with pkgs.vimPlugins; [
			fzf-vim
			# vim-nix
			# vim-sensible
			# vim-surround
			# vim-fugitive
			# vim-sayonara
			# vim-lastplace
			# limelight-vim
			# vim-commentary
			# gruvbox-community
		];
		settings = {
			number = true;
			ignorecase = true;
			background = "dark";
			relativenumber = true;
		};
		extraConfig = ''

			set tgc
			set mouse=a
			set hlsearch
			colorscheme gruvbox
			
			" " vimrc
			" set ai
			" set nu
			" set rnu
			" syntax on
			" set hlsearch
			" set incsearch
			" set ts=3 sw=3

		'';
	};
}
