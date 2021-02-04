{ config, lib, pkgs, ... }:
let
	homenetpassword = config.private.passwd.homenetwork;
in {
	environment.systemPackages = with pkgs; [

		dwm
		slstatus

	];

	# network
	networking.useDHCP = true;
	networking.wireless.enable = true;
	networking.hostName = "laptop-nixos";
	networking.interfaces.enp5s0.useDHCP = true;
	networking.interfaces.wlp2s0.useDHCP = true;
	networking.wireless.networks.TTNET_ZyXEL_YE9T = { psk = homenetpassword; };

	sound.enable = true;
	hardware.pulseaudio.enable = true;

	services.xserver.enable = true;
	services.clipmenu.enable = true;

	boot.loader.grub.device = "/dev/sdb"; # or "nodev" for efi only

}
