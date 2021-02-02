{ pkgs, ... }:
{

	programs.home-manager.enable = true;

	home.packages = with pkgs; [
		
		# # not base (move somewhere else)
		# groff
		# ffmpeg
		# svgbob
		# pandoc
		# awscli2
		# tmpmail
		# gnuchess
		# graphviz
		# signal-cli
		# neuron-notes
		# ncdu # clear out your storage devices
		# poppler_utils # pdftotext # ripgrep-all
		# ledger # delete one of ledger or hledger
		# grap # https://www.lunabase.org/~faber/Vault/software/grap/
		# cmake # this should be handled by flake.nix in build process
		# (let trends = builtins.fetchTarball "https://github.com/ihsanturk/trends/archive/master.tar.gz"; in import trends {})
		# img2txt # (personal) requires docopts 

		fd
		jq
		sd
		exa
		nnn
		pup
		gawk
		jump
		mosh
		tldr
		gnupg
		ranger
		stdman
		httrack
		ripgrep
		pinentry
		tectonic
		mitmproxy
		syncthing
		trash-cli
		shellcheck
		neovim-remote
		coreutils # tac
		translate-shell
		# image_optim # darwin is not supported
		gitAndTools.delta # for: git diff # long compile time

	];

	imports = [
		../module/bat.nix
		../module/fzf.nix
		../module/git.nix
		../module/zsh.nix
		../module/tmux.nix
		../module/neovim.nix
		../module/starship.nix
	];

	# impurely installed
	# quickjs  # location: /usr/local/bin/qjs
	# tinycc  # location /usr/local/bin/tcc

}
