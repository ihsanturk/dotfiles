{ pkgs, ... }:
{

	home.packages = with pkgs; [

		mpv
		m-cli
		ffmpeg
		# swiftbar  # NOTE: uninstall manually: "/Applications/SwiftBar.app"
		qrencode
		coreutils
		imagemagick
		unixtools.watch

	];

	programs.alacritty.enable = true;
	programs.git.extraConfig.credential.helper = "osxkeychain";

}
