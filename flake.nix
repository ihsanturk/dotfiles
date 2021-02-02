{
	description = "ihsanturk's personal machine configurations.";


	inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
	inputs.darwin.url = "github:lnl7/nix-darwin";
	inputs.darwin.inputs.nixpkgs.follows = "nixpkgs";
	inputs.home-manager.url = "github:nix-community/home-manager";
	inputs.neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";


	outputs =  { self,
		darwin,
		nixpkgs,
		home-manager,
		neovim-nightly-overlay,
		...
	}@inputs:
	let

		overlays = [ inputs.neovim-nightly-overlay.overlay ];
		pkgs = nixpkgs.legacyPackages."x86_64-darwin"; # use flake-utils.system

	in {

		darwinConfigurations = {
			MacBookAir = darwin.lib.darwinSystem {
				modules = [
					(import ./profile/mba.nix)
					home-manager.darwinModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.ihsan = import ./profile/darwin-home.nix;
						nixpkgs.overlays = overlays;
					}
				];
			};
		};

		darwinPackages = self.darwinConfigurations."simple".pkgs;
		defaultPackage.x86_64-darwin = self.darwinConfigurations.MacBookAir.system;

		# homeConfigurations = rec {
		# 	base = inputs.home-manager.lib.homeManagerConfiguration {
		# 		configuration = {...}: {
		# 			nixpkgs.overlays = overlays;
		# 			home.packages = with pkgs; [ neovim-nightly ];
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

	};

}
