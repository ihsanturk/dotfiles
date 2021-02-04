{ pkgs, ... }:
{

	home.packages = with pkgs; [

		# # apple
		# libimobiledevice

		mpv
		ffmpeg
		ledger
		qrencode
		youtube-dl
		imagemagick

	];

}
