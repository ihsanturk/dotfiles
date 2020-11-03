{ config, lib, options, ... }:
{
	services = {

		dwm-status = {
			order = [

				"audio"
				"battery"
				"network"
				"cpu_load"
				"backlight"
				"time"

			];
		};
	};

}
