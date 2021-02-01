{ pkgs, ... }:
{

	# nixpkgs.config.allowUnfree = true; # for slack;

	# TODO: install using flakes
	home.packages = with pkgs; [
		
		(let trends = builtins.fetchTarball
		"https://github.com/ihsanturk/trends/archive/master.tar.gz"; in import
		trends {})

		# unix
		gawk
		gnupg
		groff
		pandoc
		svgbob
		gnumake
		gnuchess
		recutils
		coreutils # tac
		# grap # https://www.lunabase.org/~faber/Vault/software/grap/

		fd
		jq
		sd
		exa
		nnn
		pup
		ddgr
		jump
		mosh
		pass
		s3fs
		tldr
		cmake
		hlint
		ffmpeg
		ranger
		stdman
		awscli2
		httrack
		ripgrep
		tmpmail
		graphviz
		pinentry
		tectonic
		mitmproxy
		syncthing
		trash-cli
		shellcheck
		signal-cli
		neuron-notes
		neovim-remote
		translate-shell
		ncdu # clear out your storage devices
		# image_optim # darwin is not supported
		poppler_utils # pdftotext # ripgrep-all
		ledger # delete one of ledger or hledger
		hledger # delete one of ledger or hledger
		gitAndTools.delta # for: git diff # long compile time

		# personal packages
		# img2txt # requires docopts

		# impurely installed
		# quickjs  # location: /usr/local/bin/qjs
		# tinycc  # location /usr/local/bin/tcc

	];

	programs.bat.enable = true;
	programs.fzf.enable = true;
	programs.git.enable = true;
	programs.zsh.enable = true;
	programs.tmux.enable = true;
	# programs.vim.enable = true;
	programs.neovim.enable = true;
	# programs.emacs.enable = true;
	programs.starship.enable = true;

	# # rare
	# programs.lf.enable = true;
	# programs.fish.enable = true;
	# services.gpg-agent.enable = true;
	# home.packages = with pkgs; [
	# 	niv
	# 	w3m
	# 	tree
	# 	vlang
	# 	cachix
	# 	igraph
	# 	docopts
	# 	exiftool
	# 	git-crypt
	# 	moreutils
	# 	bitwarden-cli
	# 	protonvpn-cli-ng
	# 	nix-doc # NOTE: cannot be compiled
	# 	asciidoctor # NOTE: ruby cannot be compiled
	# 	slack # using: https://slack.com/intl/en-gb/downloads/instructions/mac
	# ];

}
