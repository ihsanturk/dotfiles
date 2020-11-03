{ config, lib, pkgs, ... }:
with lib;
let
	mkStrOption = description:
		mkOption {
			inherit description;
			type = types.str;
		};
in {

	options.settings = {

		email = mkStrOption "Email";
		terminal = mkStrOption "Terminal App";
		gpgkey = mkStrOption "GnuPg Key";
		# color = mkOption {
		# 	description = "Main color scheme.";
		# 	type = types.attrs;
		# };

	};

	config.settings = import ../settings.nix;

}
