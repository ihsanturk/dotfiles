{ config, lib, pkgs, ... }:
{

	services.gpg-agent.enableSshSupport = true;
	# services.gpg-agent.pinentryFlavor = "tty";
	services.gpg-agent.sshKeys = [ "7C4901E037D4FE6B3BA263B22A9610DAF0E283D1" ];

}

