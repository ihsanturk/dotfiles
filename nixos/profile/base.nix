{ config, pkgs, ... }:
{

	# packages
	environment.systemPackages = with pkgs; [

		git
		mtr
		file
		clang
		sysstat
		inetutils

		# # not exists!?
		# pistol # for lf/ranger/nnn
		# nixos.neuron-notes

	];

	# nationality
	console.keyMap = "uk";
	console.font = "Lat2-Terminus16";
	i18n.defaultLocale = "en_GB.UTF-8";

	# bootloader
	boot.loader.grub.version = 2;
	boot.loader.grub.enable = true;
	# boot.loader.grub.efiSupport = true;
	# boot.loader.grub.efiInstallAsRemovable = true;
	# boot.loader.efi.efiSysMountPoint = "/boot/efi";
	# Define on which hard drive you want to install Grub.

	# time zone
	time.timeZone = "Europe/Istanbul";

	networking.extraHosts = import ./extrahosts-private.nix;

	# garbage collection
	nix.gc.dates = "03:15";
	nix.gc.automatic = true;
	nix.gc.options = "--delete-older-than 10d";

	# services
	services.openssh.enable = true;

	# doc
	documentation.dev.enable = true;

}
