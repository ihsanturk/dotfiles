{
	description = "ihsanturk's personal machine configurations.";


	inputs.darwin.inputs.nixpkgs.follows = "nixpkgs";
	inputs.darwin.url = "github:ihsanturk/nix-darwin";
	inputs.home-manager.url = "/Users/ihsan/code/github.com/nix-community/home-manager";
	inputs.neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
	inputs.nixpkgs.url = "/Users/ihsan/code/github.com/nixos/nixpkgs";
	inputs.solar.url = "github:ihsanturk/solar";


	outputs =  { self,
		darwin,
		solar,  # TODO: make this to a custom nixpkgs repo like (ihsanpkgs)?
		nixpkgs,
		home-manager,
		neovim-nightly-overlay,
		...
	}@inputs:
	let

		overlays = [ inputs.neovim-nightly-overlay.overlay ];
		pkgs = nixpkgs.legacyPackages."x86_64-darwin"; # TODO: use flake-utils.system

	in {

		homeConfigurations = {

			ihsan = home-manager.lib.homeManagerConfiguration {
				configuration = import ./profile/home-mba.nix {
					inherit pkgs overlays;
				};
				homeDirectory = /. + builtins.getEnv "HOME";
				system = "x86_64-darwin";
				username = "ihsan";
			};

		};

		darwinConfigurations = {

			MacBook-Air = darwin.lib.darwinSystem {
				modules = [ (import ./profile/mba.nix) ];
			};

		};

		packages.x86_64-darwin = {

			solar = inputs.solar.defaultPackage;

			# source: https://github.com/LnL7/dotfiles/flake.nix
			cpp = pkgs.callPackage
				({ buildEnv, clang-unwrapped }:
				buildEnv {
					name = "${clang-unwrapped.name}-tools";
					paths = [ ];
					pathsToLink = [ "/bin" ];
					postBuild = ''
						mkdir -p $out/bin
						ln -s ${clang-unwrapped}/bin/clangd $out/bin
					'';
				}) { inherit (pkgs.llvmPackages_9) clang-unwrapped; };

		};

		darwinPackages = self.darwinConfigurations."simple".pkgs;
		defaultPackage.x86_64-darwin = self.darwinConfigurations.MacBook-Air.system;

		apps.x86_64-darwin.home-manager = {
			type = "app";
			program = "${home-manager.defaultPackage.x86_64-darwin}/bin/home-manager";
		};

	};

}
