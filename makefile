include config.mk

default: core
core: zsh
	xargs brew install < core.txt

alacritty:
	mkdir -p "${HOME}/.config/alacritty"
	cp alacritty.yml ~/.config/alacritty/

zsh:
	mkdir -p "${HOME}/.zsh"
	[ -d "${HOME}/.zsh/pure" ] || git clone https://github.com/sindresorhus/pure.git "${HOME}/.zsh/pure"
	[ -d "${HOME}/.zsh/zsh-autosuggestions" ] || git clone https://github.com/zsh-users/zsh-autosuggestions "${HOME}/.zsh/zsh-autosuggestions"
	[ -d "${HOME}/.zsh/zsh-syntax-highlighting" ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting "${HOME}/.zsh/zsh-syntax-highlighting"
	cp alias ~/.alias;
	cp zshrc ~/.zshrc;
uninstall-zsh:
	rm -rf "${HOME}/.zsh"
	rm -rf ~/.zshrc
	rm -rf ~/.alias

clean:
	rm -rf nvim-macos.tar.gz
	rm -rf nvim-osx64
	rm -rf ${LUAVERSION}.tar.gz

