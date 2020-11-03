{ pkgs, ... }:
{

	home.packages = with pkgs; [

		mpv
		m-cli
		ffmpeg
		qrencode
		coreutils
		imagemagick
		unixtools.watch

	];

	programs.alacritty.enable = true;

	programs.git = {
		extraConfig = {
			credential.helper = "osxkeychain";
		};
	};

}
