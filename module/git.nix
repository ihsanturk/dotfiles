{ config, pkgs, ... }:
let

	githubusername = "ihsanturk";
	email = "ihsanl@pm.me"; # TODO: take this from env.nix
	gpgkey = "467DD48CFC891A65"; # TODO: take this from env.nix

in {
	programs.git = {

		enable = true;
		userName = config.home.username;
		userEmail = email;
		signing.key = gpgkey;

		extraConfig = {
			signing.key = gpgkey;
			user.signingkey = gpgkey;
			commit.gpgsign = true;
			github.user = githubusername;
			mergetool.keepBackup = true;
			# signing.gpgPath = "${pkgs.gnupg}/bin/gpg2";
			interactive.diffFilter = "${pkgs.gitAndTools.delta}/bin/delta --color-only";
			core = {
					# --plus-color=\"#012800\" --minus-color=\"#340001\"
					pager = "${pkgs.gitAndTools.delta}/bin/delta --theme='base16'";
					whitespace = "trailing-space,space-before-tab";
			};
			# color.ui = true;
			color = {
				status = "auto";
				diff = "auto";
				branch = "auto";
				interactive = "auto";
				ui = "auto";
				sh = "auto";
			};
			merge = {
				conflictstyle = "diff3";
				stat = true;
			};
			"color \"sh\"" = {
				branch = "yellow reverse";
				workdir = "blue bold";
				dirty = "red";
				dirty-stash = "red";
				repo-state = "red";
			};
		};

		aliases = {
			amend = "commit --amend -C HEAD";
			authors = "!\"${pkgs.git}/bin/git log --pretty=format:%aN"
								 + " | ${pkgs.coreutils}/bin/sort"
								 + " | ${pkgs.coreutils}/bin/uniq -c"
								 + " | ${pkgs.coreutils}/bin/sort -rn\"";
			b = "branch --color -v";
			ca = "commit --amend";
			changes = "diff --name-status -r";
			clone = "clone --recursive";
			co = "checkout";
			cp = "cherry-pick";
			dc = "diff --cached";
			dh = "diff HEAD";
			ds = "diff --staged";
			ls-ignored = "ls-files --exclude-standard --ignored --others";
			rc = "rebase --continue";
			ri = "rebase --interactive";
			spull = "!${pkgs.git}/bin/git stash"
								 + " && ${pkgs.git}/bin/git pull"
								 + " && ${pkgs.git}/bin/git stash pop"
								 + " && ${pkgs.git}/bin/git stash apply";
			undo = "reset --soft HEAD^";
			w = "status -sb";
			wdiff = "diff --color-words";
			l = "log --graph --pretty=format:'%Cred%h%Creset"
								 + " —%Cblue%d%Creset %s %Cgreen(%cr)%Creset'"
								 + " --abbrev-commit --date=relative --show-notes=*";
		};

	};
}
