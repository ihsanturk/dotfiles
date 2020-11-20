{ pkgs, ... }:
{

	nixpkgs.config.allowUnfree = true; # for slack;

	home.packages = with pkgs; [

		# TODO: install using flakes
		# trends
		(let s = builtins.fetchTarball "https://github.com/ihsanturk/trends/archive/master.tar.gz"; in import s {})

		fd
		jq
		sd
		exa
		nnn
		ddgr
		gawk
		jump
		mosh
		pass
		tldr
		gnupg
		groff
		ranger
		gnumake
		ripgrep
		tmpmail
		gnuchess
		pinentry
		recutils
		mitmproxy
		moreutils
		syncthing
		trash-cli
		neovim-remote
		coreutils # tac
		translate-shell
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
	programs.emacs.enable = true;
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
	# 	neuron-notes
	# 	bitwarden-cli
	# 	protonvpn-cli-ng
	# 	nix-doc # NOTE: cannot be compiled
	# 	asciidoctor # NOTE: ruby cannot be compiled
	# 	slack # using: https://slack.com/intl/en-gb/downloads/instructions/mac
	# ];

}
