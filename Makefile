default: home-manager

NIXOSARGS?=
HOMEARGS?=

nix-os:
	# sudo ln -ids ${PWD}/nixos /etc/nixos
	sudo ln -is ${PWD}/nixos /etc/nixos
	sudo nixos-rebuild switch ${NIXOSARGS}

home-manager:
	# ln -ids ${PWD}/home ${HOME}/.config/nixpkgs
	ln -is ${PWD}/home ${HOME}/.config/nixpkgs
	home-manager switch ${HOMEARGS}

darwin:
	ln -is ${PWD}/darwin

uninstall:
	sudo rm -rf /etc/nixos
	sudo rm -rf ${HOME}/.config/nixpkgs
