{
	description = "ihsanturk's personal machine configurations.";

	inputs = {

		darwin.url = "github:lnl7/nix-darwin";
		darwin.inputs.nixpkgs.follows = "nixpkgs";
		nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-20.09-darwin";

	};

	outputs = { self, darwin, nixpkgs }:
	let

		# overlays = [
		# 	(import ./overlay)
		# ];

		mba = { config, lib, pkgs, ... }: {
			programs.zsh.enable = true;
			programs.zsh.promptInit = ""; # using starship.
			programs.zsh.enableSyntaxHighlighting = true;
			environment.shells = [ pkgs.zsh ];

			nix.package = pkgs.nixFlakes; # NOTE: EXPERIMENTAL.

			nix.extraOptions =
				lib.optionalString (config.nix.package == pkgs.nixFlakes)
				"experimental-features = nix-command flakes";

			fonts = {
				enableFontDir = true;
				fonts = with pkgs; [ # quit from font book app
					(nerdfonts.override {fonts = ["FiraCode"];})
					# fira-code-symbols
					# nerd-fonts.firacode
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
			system.defaults.finder._FXShowPosixPathInTitle = false;

			system.stateVersion = 4;
		};

	in
	{

		darwinConfigurations."MacBookAir" = darwin.lib.darwinSystem {
			modules = [ mba # { nixpkgs.overlays = overlays; } ];
		};

		darwinPackages = self.darwinConfigurations."simple".pkgs;
	};


}
