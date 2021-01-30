{
	description = "ihsanturk's personal machine configurations.";

	inputs = {

		darwin.url = "github:lnl7/nix-darwin";
		darwin.inputs.nixpkgs.follows = "nixpkgs";
		nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-20.09-darwin";

	};

	outputs = inputs @ { self, darwin, nixpkgs }:
	let

		configuration = { config, lib, pkgs, ... }: {
			programs.zsh.enable = true;
			programs.zsh.promptInit = ""; # using starship.
			programs.zsh.enableSyntaxHighlighting = true;
			environment.shells = [ pkgs.zsh ];

			nixpkgs.overlays = ./overlay;
			nix.package = pkgs.nixFlakes; # NOTE: EXPERIMENTAL.
			nix.extraOptions =
				lib.optionalString (config.nix.package == pkgs.nixFlakes)
				"experimental-features = nix-command flakes";

			fonts = {
				enableFontDir = true;
				fonts = with pkgs; [ # quit from font book app
					fira-code-symbols
					nerd-fonts.firacode
				];
			};

			# nix.nixPath = [
			# 	"darwin-config=$HOME/.nixpkgs/darwin-configuration.nix"
			# 	"darwin=$HOME/.nix-defexpr/channels/darwin"
			# 	"$HOME/.nix-defexpr/channels"
			# ];

			# defaults
			system.defaults.dock.tilesize = 33;
			system.defaults.dock.show-recents = false;
			system.defaults.finder.QuitMenuItem = true;
			system.defaults.NSGlobalDomain.KeyRepeat = 1;
			system.defaults.NSGlobalDomain.InitialKeyRepeat = 10;
			system.defaults.NSGlobalDomain._HIHideMenuBar = false;
			system.defaults.finder._FXShowPosixPathInTitle = false; # full path on finder

			system.stateVersion = 4;
		};

	in
	{

		darwinConfigurations."MacBookAir" = darwin.lib.darwinSystem {
			modules = [ configuration ]; # darwin.darwinModules.simple 
		};

		darwinPackages = self.darwinConfigurations."simple".pkgs;

	};
}
