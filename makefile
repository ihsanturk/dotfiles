include config.mk

default: core
core: zsh vim git gpg
graphical: alacritty

pkgs:
	uname -a | grep -q '^Darwin' && { /bin/cat pkgs-common pkgs-mac | xargs brew install; brew leaves | sort > brew-leaves; /bin/cat pkgs-common pkgs-mac | sort | comm - brew-leaves -13 | xargs brew uninstall; rm -rf brew-leaves; } || true;
	uname -a | grep -q 'Alpine' && { /bin/cat pkgs-common pkgs-alpine | xargs sudo apk add; } || true;

uninstall: uninstall-alacritty uninstall-zsh uninstall-git

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
	cp alacritty.yml ~/.config/alacritty/
	cp alacritty-color.yml ~/.config/alacritty/color.yml
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
	rm -rf "${HOME}/.zsh"
	rm -rf "${HOME}/.zshrc"
	rm -rf "${HOME}/.alias"

vim:
	cp vimrc ${HOME}/.vimrc
uninstall-vim:
	rm -rf "${HOME}/.vimrc

