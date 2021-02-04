{ config, ... }:
{
	services.openssh = {

		permitRootLogin = "no";

	};
}
