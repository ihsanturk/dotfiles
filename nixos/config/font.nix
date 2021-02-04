{ config, options, pkgs, ... }:
{
	fonts.fonts = with pkgs; [

		fira-code-symbols
		nerd-fonts.firacode

	];
}

