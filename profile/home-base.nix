{ pkgs, ... }:
{

	programs.home-manager.enable = true;

	home.packages = with pkgs; [
		
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
		emv # rename files with your favourite text editor
		gitAndTools.delta # for: git diff # long compile time

	];

	imports = [
		../module/bat.nix
		../module/fzf.nix
		../module/git.nix
		../module/zsh.nix
		../module/tmux.nix
		../module/ledger.nix
		../module/neovim.nix
		../module/starship.nix
	];

	# impurely installed
	# tinycc  # location /usr/local/bin/tcc
	# quickjs  # location: /usr/local/bin/qjs

}
