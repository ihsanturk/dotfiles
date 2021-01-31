{
	description = "ihsanturk's personal machine configurations.";


	inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-20.09-darwin";
	inputs.darwin.url = "github:lnl7/nix-darwin";
	inputs.darwin.inputs.nixpkgs.follows = "nixpkgs";
	# inputs.home-manager.url = "github:nix-community/home-manager/master";
	# inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";
	# inputs.neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

	outputs =  { self, darwin, nixpkgs, ... }@inputs:
	let

		pkgs = nixpkgs.legacyPackages."x86_64-darwin";

		overlays = [
			inputs.neovim-nightly-overlay.overlay
		];

		mba = { config, lib, pkgs, ... }: {
			environment.systemPackages = with pkgs; [ neovim ];
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
				fonts = with pkgs; [ # quit from Font Book app
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

	in {

		darwinConfigurations = {
			macbookair = darwin.lib.darwinSystem {
				modules = [
					mba
					# home-manager.darwinModules.home-manager {
					# 	home-manager.useGlobalPkgs = true;
					# 	home-manager.useUserPkgs = true;
					# }
				];
			};
		};

		# homeConfigurations = rec {

		# 	base = inputs.home-manager.lib.homeManagerConfiguration {

		# 		configuration = {...}: {

		# 			nixpkgs.overlays = overlays;
		# 			# home.packages = with pkgs; [ neovim-nightly ];
	
		# 		};

		# 		system = "x86_64-darwin";
		# 		homeDirectory = "/Users/ihsan";
		# 		# home.stateVersion = "20.09";
		# 		username = "ihsan";

		# 	};

		# 	macbookair = base;

		# 	# linode-server = inputs.home-manager.lib.homeManagerConfiguration {
		# 	# }

		# };

		darwinPackages = self.darwinConfigurations."simple".pkgs;
		mba-darwin = self.darwinConfigurations.macbookair.system;
		# mba-home = self.homeConfigurations.macbookair.activationPackage;

		defaultPackage.x86_64-darwin = self.mba-darwin;

	};


}
