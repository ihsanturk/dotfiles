include config.mk

default: core
core: zsh vim git gpg tmux w3m
graphical: alacritty mpv

pkgs:
	./install-pkgs.sh

uninstall: uninstall-alacritty uninstall-zsh uninstall-git uninstall-x

rust:
	touch ${HOME}/.zshenv
	touch ${HOME}/.profile
	which -s rustup || curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	rustup component add rust-src rls rust-analysis rust-src
	# TODO: detect os and install based on the pkg manager and system.
	curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-apple-darwin.gz | gunzip -c - > ~/bin/rust-analyzer
	chmod +x ~/bin/rust-analyzer
uninstall-rust:
	rustup self uninstall

mpv:
	mkdir -p ~/.config/mpv
	cp mpv.conf ~/.config/mpv/
uninstall-mpv:
	rm -rf ~/.config/mpv/mpv.conf
	[ -z "$(ls -A ${HOME}/.config/mpv/)" ] && rm -rf "${HOME}/.config/mpv"

w3m:
	mkdir -p ~/.w3m
	cp w3mrc ~/.w3m/keymap
uninstall-w3m:
	rm -rf ~/.w3m/keymap
	[ -z "$(ls -A ${HOME}/.w3m/)" ] && rm -rf "${HOME}/.w3m"

tmux:
	mkdir -p "${HOME}/.tmux/plugins"
	[ -d ~/.tmux/plugins/tpm ] || git clone https://github.com/tmux-plugins/tpm.git "${HOME}/.tmux/plugins/tpm"
	cp tmux.conf ${HOME}/.tmux.conf
uninstall-tmux:
	rm -rf ~/.tmux.conf

gpg:
	cp gpg-agent.conf ~/.gnupg/
uninstall-gpg:
	rm -rf ~/.gnupg/gpg-agent.conf;

git:
	cp gitconfig ~/.gitconfig;
uninstall-git:
	rm -rf ~/.gitconfig;

alacritty:
	mkdir -p "${HOME}/.config/alacritty"
	cp alacrittyrc.yml ~/.config/alacritty/alacritty.yml
	sh -c 'cp alacritty-color.yml ~/.config/alacritty/color.yml'
uninstall-alacritty:
	rm -rf "${HOME}/.config/alacritty/alacritty.yaml"
	rm -rf "${HOME}/.config/alacritty/color.yml"
	[ -z "$(ls -A ${HOME}/.config/alacritty)" ] && rm -rf "${HOME}/.config/alacritty"

zsh:
	mkdir -p "${HOME}/.zsh"
	[ -d "${HOME}/.zsh/pure" ] || git clone https://github.com/sindresorhus/pure.git "${HOME}/.zsh/pure"
	[ -d "${HOME}/.zsh/zsh-autosuggestions" ] || git clone https://github.com/zsh-users/zsh-autosuggestions "${HOME}/.zsh/zsh-autosuggestions"
	[ -d "${HOME}/.zsh/zsh-syntax-highlighting" ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting "${HOME}/.zsh/zsh-syntax-highlighting"
	cp alias ~/.alias;
	cp zshrc ~/.zshrc;
	cp funct ~/.funct;
uninstall-zsh:
	rm -rf "${HOME}/.zsh"
	rm -rf "${HOME}/.zshrc"
	rm -rf "${HOME}/.alias"

vim:
	cp vimrc ${HOME}/.vimrc
	mkdir -p ${HOME}/.config/nvim/
	ln -fs ~/.vimrc ${HOME}/.config/nvim/init.vim
uninstall-vim:
	rm -rf "${HOME}/.vimrc
	rm -rf "${HOME}/.nvim

x:
	# # alpine
	# setup-xorg-base dwm st xf86-video-intel
	# rc-update add dbus
	# rc-service dbus start
	# apk add xf86-input-mouse xf86-input-keyboard
	cp xinitrc ${HOME}/.xinitrc
uninstall-x:
	rm -rf ${HOME}/.xinitrc


.PHONY: all alacritty
