{ config, lib, ... }:
let

	# config
	profile = "server-linode"; # "laptop-casper";

	optionals = lib.optionals;
	importFilesFrom = dir: lib.mapAttrsToList
		(name: _: dir + "/${name}")
		(lib.filterAttrs
			(name: _: lib.hasSuffix ".nix" name)
			(builtins.readDir dir));

in {

	imports = (importFilesFrom ./module) ++ [

		./config
		./profile/base.nix
		(./hardware + ("/" + profile + ".nix"))
		(./profile  + ("/" + profile + ".nix" ))

	];

	nixpkgs.overlays = import ./overlay;
	system.stateVersion = "20.09";

}

