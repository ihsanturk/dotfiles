{ pkgs, overlays, ... }:
{

	nixpkgs.overlays = overlays;

	imports = [
		./home-base.nix # { inherit private; }

		../module/alacritty.nix
		# ../module/karabiner-elements.nix # NOTE: not tested yet.

		../dev-env/c.nix
		../dev-env/cpp.nix
		../dev-env/rust.nix
		../dev-env/python.nix

	];


	home.packages = with pkgs; [

		coreutils       # extra coreutils
		ffmpeg          # manipulate/edit video or image
		graphviz        # visualize graphs
		ledger          # manage money and budgets
		m-cli           # swiss army knife for macos
		mpv             # play video, image or audio
		ncdu            # clear out your storage devices
		poppler_utils   # pdftotext # for ripgrep-all
		qrencode        # encode data to qr codes
		unixtools.watch # better `watch`
		youtube-dl      # download video from web

		# [rare]
		# awscli2         # manage aws
		# cordless        # minimal discrod client cli
		# groff           # process text and rendering
		# imagemagick     # manipulate/convert images
		# pandoc          # convert across text formats
		# spotify-tui     # spotify client
		# svgbob          # convert ascii to closest svg


		# # problematic
		# (let trends = builtins.fetchTarball "https://github.com/ihsanturk/trends/archive/master.tar.gz"; in import trends {})
		# grap          # https://www.lunabase.org/~faber/Vault/software/grap/
		# img2txt       # (personal) requires docopts
		# iterm2        # alternative terminal to default os terminal
		# swiftbar      # NOTE: uninstall manually: "/Applications/SwiftBar.app"
		# tmpmail       # FIXME: make this flake compatible
		# übersitch     # NOTE: uninstall manually: "/Applications/Übersicht.app"

	];

	programs.git.extraConfig.credential.helper = "osxkeychain";

}
