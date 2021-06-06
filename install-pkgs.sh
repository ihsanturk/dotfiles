#!/bin/sh

uname -a | grep -q '^Darwin' && {
	which -s brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew leaves | sort > brew-leaves && REMOVEBREWLEAVES=true

	grep -o '^[^ ]*' pkgs-common pkgs-mac | cut -d: -f2 | sort -u |
		comm - brew-leaves -23 |
		xargs -I_ sh -c 'brew install _';

	# # uninstall
	# /bin/cat pkgs-common pkgs-mac | sort |
	# 	comm - brew-leaves -13 |
	# 	xargs brew uninstall;

	[ $REMOVEBREWLEAVES ] && rm -rf brew-leaves;
} || true;

uname -a | grep -q 'Alpine' && {

	/bin/cat pkgs-common pkgs-alpine |
		xargs sudo apk add;

} || true;

