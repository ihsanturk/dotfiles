{ config, ... }:
{
	nixpkgs.config = {

		packageOverrides = pkgs: {
			unstable = import <nixos-unstable> {
				config = config.nixpkgs.config;
			};

			slstatus = pkgs.slstatus.override {
				conf = builtins.readFile ./config.h;
			};

		};

	};
}
