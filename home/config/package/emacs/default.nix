{ config, lib, pkgs, ... }:
{
	programs.emacs = {

		extraPackages = (epkgs: with epkgs; [

			ivy
			evil
			nix-mode
			undo-tree
			gruvbox-theme

		]);
	};
}
