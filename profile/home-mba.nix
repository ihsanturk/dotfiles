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

		mpv
		groff
		m-cli
		ffmpeg
		ledger
		pandoc
		svgbob
		awscli2
		graphviz
		qrencode
		coreutils
		youtube-dl
		imagemagick
		neuron-notes
		unixtools.watch
		ncdu # clear out your storage devices
		poppler_utils # pdftotext # for ripgrep-all

		# # problematic
		# img2txt # (personal) requires docopts 
		# tmpmail # FIXME: make this flake compatible
		# swiftbar  # NOTE: uninstall manually: "/Applications/SwiftBar.app"
		# grap # https://www.lunabase.org/~faber/Vault/software/grap/
		# (let trends = builtins.fetchTarball "https://github.com/ihsanturk/trends/archive/master.tar.gz"; in import trends {})

	];

	programs.git.extraConfig.credential.helper = "osxkeychain";

}
