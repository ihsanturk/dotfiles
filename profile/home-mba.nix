# { pkgs, private, ... }:
{ pkgs, ... }:
{

	imports = [
		./home-base.nix # { inherit private; }

		../module/alacritty.nix

	];


	home.packages = with pkgs; [
		
		groff
		ffmpeg
		svgbob
		ledger
		pandoc
		awscli2
		graphviz
		neuron-notes
		ncdu # clear out your storage devices
		poppler_utils # pdftotext # for ripgrep-all

		# # problematic
		# img2txt # (personal) requires docopts 
		# tmpmail # FIXME: make this flake compatible
		# grap # https://www.lunabase.org/~faber/Vault/software/grap/
		# (let trends = builtins.fetchTarball "https://github.com/ihsanturk/trends/archive/master.tar.gz"; in import trends {})

	];

}
