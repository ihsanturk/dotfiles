{ config, lib, ... }:
with lib;
let

	mkStrOption = description:
		mkOption {
			inherit description;
			type = types.str;
		};

in {

	options = {
		private = {
			passwd = {

				redispass = mkStrOption "Redis password.";
				homenetwork = mkStrOption "Home Network password.";
				twitterIhsanturkIhsan = mkStrOption "Ihsan's password";
				twitterIhsanturkUlakfin = mkStrOption "Ulakfin's password";

			};
		};
	};

	config = (import ../private.nix);

}
