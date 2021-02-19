# { pkgs, private, ... }:
{ pkgs, ... }:
{

	imports = [
		./home-base.nix # { inherit private; }

		../module/alacritty.nix

		../dev-env/c.nix
		../dev-env/cpp.nix
		../dev-env/rust.nix
		../dev-env/python.nix

	];


	home.packages = with pkgs; [

		awscli2         # manage aws
		coreutils       # extra coreutils
		ffmpeg          # manipulate/edit video or image
		graphviz        # visualize graphs
		groff           # process text and rendering
		imagemagick     # manipulate/convert images
		ledger          # manage money and budgets
		m-cli           # swiss army knife for macos
		mpv             # play video, image or audio
		ncdu            # clear out your storage devices
		neuron-notes    # manage zettelkasten notes
		pandoc          # convert across text formats
		poppler_utils   # pdftotext # for ripgrep-all
		qrencode        # encode data to qr codes
		svgbob          # convert ascii to closest svg
		unixtools.watch # better `watch`
		youtube-dl      # download video from web

		# # problematic
		# img2txt       # (personal) requires docopts 
		# tmpmail       # FIXME: make this flake compatible
		# swiftbar      # NOTE: uninstall manually: "/Applications/SwiftBar.app"
		# grap          # https://www.lunabase.org/~faber/Vault/software/grap/
		# (let trends = builtins.fetchTarball "https://github.com/ihsanturk/trends/archive/master.tar.gz"; in import trends {})

	];

	programs.git.extraConfig.credential.helper = "osxkeychain";

}
