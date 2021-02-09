{ pkgs, ... }:
let

	impurePaths = [

		"$HOME/.cargo/bin"
		"$HOME/Library/Python/3.8/bin"
		"$HOME/Sync/bin"
		"/usr/local/mysql/bin"

	];

in {

	programs.home-manager.enable = true;

	home.packages = with pkgs; [
		
		cachix            # fetch cache
		coreutils         # tac
		emv               # rename files with your favourite text editor
		exa               # `ls` alternative.
		fd                # `find` alternative written in rust.
		gawk              # manipulate text. `awk` alternative.
		gitAndTools.delta # for: git diff (long compile time)
		gnupg             # encrypt/decrypt files or data.
		jq                # query json.
		mosh              # `ssh` alternative.
		nnn               # file manager written in c.
		pinentry          # password taker... i guess?
		pup               # query html.
		ranger            # file manager written in python.
		ripgrep           # `grep` alternative
		sd                # `sed` alternative.
		shellcheck        # shell code suggester/linter. helps you write better.
		stdman            # std libary man pages
		syncthing         # synchronise files between remote machines
		tldr              # get quick examples about usage of the program.
		translate-shell   # google translate in cli written in awk.
		trash-cli         # trash files instead of bare rm

		# [rare]
		# termeter    # TODO: add this
		# httrack     # download whole websites
		# image_optim # darwin is not supported
		# lynx        # browser runs in cli, supports gopher://
		# mitmproxy   # sniff requests
		# nixfmt      # format nix expressions.
		# tectonic    # [don't know]

	];

	home.sessionVariables = {

		DIR_CODE = "$HOME/Sync/code";
		DIR_LEARN = "$HOME/Sync/code/github.com/ihsanturk/learn";
		EDITOR = "nvim";
		GPG_TTY = "$(tty)";
		PATH = (builtins.concatStringsSep ":" impurePaths) + ":$PATH";

	};

	imports = [

		../module/bat.nix
		../module/fzf.nix
		../module/git.nix
		../module/h.nix
		../module/ledger.nix
		../module/neovim.nix
		../module/starship.nix
		../module/tmux.nix
		../module/zsh.nix

		../dev-env/nix.nix

	];

	# impurely installed
	# quickjs  # location: /usr/local/bin/qjs
	# tinycc   # location /usr/local/bin/tcc

}
