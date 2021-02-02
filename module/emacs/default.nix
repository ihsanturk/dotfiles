{ config, lib, pkgs, ... }:
{
	programs.emacs = {

		enable = true;
		extraPackages = (epkgs: with epkgs; [

			ivy
			evil
			nix-mode
			undo-tree
			gruvbox-theme

		]);
	};
}
