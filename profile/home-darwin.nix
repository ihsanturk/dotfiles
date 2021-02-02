{ pkgs, ... }:
{

	imports = [ ./base.nix ];

	home.packages = with pkgs; [
		
		groff
		ffmpeg
		svgbob
		pandoc
		awscli2
		tmpmail
		gnuchess
		graphviz
		signal-cli
		neuron-notes
		ncdu # clear out your storage devices
		poppler_utils # pdftotext # ripgrep-all
		ledger # delete one of ledger or hledger
		grap # https://www.lunabase.org/~faber/Vault/software/grap/
		cmake # this should be handled by flake.nix in build process
		(let trends = builtins.fetchTarball "https://github.com/ihsanturk/trends/archive/master.tar.gz"; in import trends {})
		img2txt # (personal) requires docopts 

	];

}
