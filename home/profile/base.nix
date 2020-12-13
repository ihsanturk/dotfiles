{ pkgs, ... }:
{

	nixpkgs.config.allowUnfree = true; # for slack;

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
		ddgr
		jump
		mosh
		pass
		tldr
		hlint
		ffmpeg
		ranger
		# vlang
		hledger
		ripgrep
		tmpmail
		# tinycc
		pinentry
		mitmproxy
		syncthing
		trash-cli
		neuron-notes
		neovim-remote
		translate-shell
		poppler_utils # pdftotext # ripgrep-all
		# quickjs # installed impurely /usr/local/bin/qjs
		gitAndTools.delta # for: git diff # long compile time

		# personal packages
		# img2txt # requires docopts

	];

	programs.bat.enable = true;
	programs.fzf.enable = true;
	programs.git.enable = true;
	programs.vim.enable = true;
	programs.zsh.enable = true;
	programs.tmux.enable = true;
	# programs.emacs.enable = true;
	programs.neovim.enable = true;
	programs.starship.enable = true;

	# # rare
	# programs.lf.enable = true;
	# programs.fish.enable = true;
	# services.gpg-agent.enable = true;
	# home.packages = with pkgs; [
	# 	niv
	# 	w3m
	# 	tree
	# 	cachix
	# 	igraph
	# 	ledger
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
