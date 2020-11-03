{ config }:
{

	# network
	networking.useDHCP = false;
	networking.hostName = "linode-nixos";
	networking.interfaces.eth0.useDHCP = true;
	networking.usePredictableInterfaceNames = false;

	security.acme.acceptTerms = true;
	security.acme.email = import ./my-email-private.nix;

	services.nginx.enable = true;
	services.redis.enable = true;
	services.mongodb.enable = true;

	# users.users.ihsan.extraGroups = [
	# 	"wheel"
	# 	"docker"
	# 	"mongodb"
	# 	"docker-compose"
	# 	"networkmanager"
	# ];

}
