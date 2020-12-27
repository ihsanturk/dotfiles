{ pkgs, ... }:
{

	home.packages = with pkgs; [

		# # apple
		# libimobiledevice

		mpv
		ffmpeg
		qrencode
		youtube-dl
		imagemagick

	];

}
