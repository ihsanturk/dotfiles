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
			codeStatsAPIKey = mkStrOption "CodeStats API Key";
			googleCalendarApiKey = mkStrOption "Google Calendar API Key";
			googleCalendarClientId = mkStrOption "Google Calendar Client ID";
			googleCalendarSecret = mkStrOption "Google Calendar Secret";
		};
	};

	config = (import ../private.nix);

}
