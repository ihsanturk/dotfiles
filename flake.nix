{
	description = "ihsanturk's personal machine configurations.";


	inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
	inputs.darwin.url = "github:lnl7/nix-darwin";
	inputs.darwin.inputs.nixpkgs.follows = "nixpkgs";
	inputs.home-manager.url = "github:nix-community/home-manager";
	inputs.neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
	# inputs.private.url = "path:./private.nix";
	# inputs.private.flake = false;


	outputs =  { self,
		darwin,
		nixpkgs,
		home-manager,
		neovim-nightly-overlay,
		...
	}@inputs:
	let

		overlays = [ inputs.neovim-nightly-overlay.overlay ];
		pkgs = nixpkgs.legacyPackages."x86_64-darwin"; # TODO: use flake-utils.system

	in {

		darwinConfigurations = {
			MacBook-Air = darwin.lib.darwinSystem {
				modules = [
					(import ./profile/mba.nix)
					home-manager.darwinModules.home-manager {
						nixpkgs.overlays = overlays;
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.ihsan = import ./profile/home-mba.nix;
					}
				];
				# specialArgs = { inherit (self.inputs.private); };
			};
		};

		darwinPackages = self.darwinConfigurations."simple".pkgs;
		defaultPackage.x86_64-darwin = self.darwinConfigurations.MacBookAir.system;

	};

}
