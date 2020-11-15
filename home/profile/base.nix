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
		# cachix
		gnuchess
		recutils
		# docopts
		moreutils
		syncthing
		trash-cli
		neovim-remote
		# neuron-notes
		# bitwarden-cli
		coreutils # tac
		translate-shell
		# nix-doc # NOTE: cannot be compiled
		# asciidoctor # NOTE: ruby cannot be compiled
		gitAndTools.delta # for: git diff # long compile time
		# slack # using: https://slack.com/intl/en-gb/downloads/instructions/mac

		# personal packages
		# img2txt # requires docopts

	];

	programs.bat.enable = true;
	programs.fzf.enable = true;
	programs.git.enable = true;
	programs.vim.enable = true;
	programs.zsh.enable = true;
	programs.tmux.enable = true;
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
	# 	igraph
	# 	ledger
	# 	exiftool
	# 	git-crypt
	# 	protonvpn-cli-ng
	# ];

}
