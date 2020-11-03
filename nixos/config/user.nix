{ config, pkgs, ... }:
{ # don't forget to set a password with ‘passwd’
	users.users.ihsan = {

		shell = pkgs.fish;
		isNormalUser = true;
		home = "/home/ihsan";
		extraGroups = [
			"wheel" # Enable ‘sudo’ for the user.
			"docker" "docker-compose" # for: ulakfin
		];

	};
}
