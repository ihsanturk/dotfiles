{ config, ... }:
{
	services = {
		redis = {

			openFirewall = true;
			requirePass = config.private.passwd.redispass;

		};
	};
}
