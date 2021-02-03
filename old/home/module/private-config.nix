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
			ftxApiKey = mkStrOption "FTX API Key";
			ftxSecKey = mkStrOption "FTX Secret Key";
			binanceApiKey = mkStrOption "Binance API Key";
			binanceSecKey = mkStrOption "Binance Secret Key";
			codeStatsAPIKey = mkStrOption "CodeStats API Key";
			googleCalendarSecret = mkStrOption "Google Calendar Secret";
			googleCalendarApiKey = mkStrOption "Google Calendar API Key";
			googleCalendarClientId = mkStrOption "Google Calendar Client ID";
		};
	};

	config = (import ../private.nix);

}
