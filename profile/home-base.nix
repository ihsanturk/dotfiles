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
		
		emv               # rename files with your favourite text editor.
		entr              # some kind of watcher and runner
		fd                # `find` alternative written in rust.
		gawk              # manipulate text. `awk` alternative.
		gitAndTools.delta # git diff (long compile time).
		gitui             # git terminal ui
		gnupg             # encrypt/decrypt files or data.
		jq                # query json.
		pinentry          # password taker... i guess?
		pup               # query html.
		python38Packages.titlecase # convert regular text to its title form.
		ranger            # file manager written in python.
		ripgrep           # `grep` alternative written in rust.
		sd                # `sed` alternative written in rust.
		stdman            # std libary man pages
		tldr              # get quick examples about usage of the program.
		translate-shell   # google translate in cli written in awk.
		trash-cli         # trash files instead of bare rm.
		vscodium          # code editor.
		websocat          # websocket client

	];
	home.sessionVariables = {

		DIR_CODE  = "$HOME/Sync/code";
		DIR_LEARN = "$HOME/Sync/code/github.com/ihsanturk/learn";
		EDITOR    = "nvim";
		GPG_TTY   = "$(tty)";
		LANG      = "en_GB.UTF-8";
		PATH      = (builtins.concatStringsSep ":" impurePaths) + ":$PATH";

	};
	imports = [

		../module/autojump.nix
		../module/bash.nix
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

}
