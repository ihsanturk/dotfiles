# { pkgs, private, ... }:
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
		cachix
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
		coreutils # tac
		translate-shell
		# image_optim # darwin is not supported
		emv # rename files with your favourite text editor
		gitAndTools.delta # for: git diff # long compile time

	];

	home.sessionVariables = {
		EDITOR = "nvim";
		GPG_TTY = "$(tty)";
		DIR_LEARN = "$HOME/Sync/code/github.com/ihsanturk/learn";
		PATH = "/usr/local/mysql/bin:$HOME/Sync/bin:$HOME/.cargo/bin:$HOME/Library/Python/3.8/bin:$PATH";
	}; # // private.sessionVariables;

	imports = [

		../module/bat.nix
		../module/fzf.nix
		../module/git.nix
		../module/zsh.nix
		../module/tmux.nix
		../module/ledger.nix
		../module/neovim.nix
		../module/starship.nix

		../dev-env/nix.nix

	];

	# impurely installed
	# tinycc  # location /usr/local/bin/tcc
	# quickjs  # location: /usr/local/bin/qjs

}
