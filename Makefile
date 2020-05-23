include config.mk

bat:
	mkdir -p $(shell dirname ${_BAT})
	ln -fs ${PWD}/batrc ${_BAT}

ultisnips:
	ln -fs ${PWD}/ulti-snippets/ ${_ULTI_SNIPS}/ultisnips

vimplug:
	[ -f ${_VIMPLUG} ] || curl -sfLo ${_VIMPLUG} --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim:
	mkdir -p $(shell dirname ${_VIM})
	ln -s ${PWD}/vimrc ${_VIM}

nvim: vimplug
	mkdir -p $(shell dirname ${_NVIM})
	ln -fs ${PWD}/nvimrc ${_NVIM}

emacs:
	mkdir -p ${_EMACS}
	ln -fs ${PWD}/emacs-config/init.el ${_EMACS}/
	ln -fs ${PWD}/emacs-config/configuration.org ${_EMACS}/

shell_helpers:
	mkdir -p ${_SHELL_HELPERS}
	ln -fs ${PWD}/func ${_SHELL_HELPERS}/.func
	ln -fs ${PWD}/alias ${_SHELL_HELPERS}/.alias
	ln -fs ${PWD}/profile ${_SHELL_HELPERS}/.profile
	ln -fs ${PWD}/abbrev.zsh ${_SHELL_HELPERS}/.abbrev.zsh

zsh: shell_helpers
	mkdir -p $(shell dirname ${_ZSH})
	ln -fs ${PWD}/zshrc ${_ZSH}

alacritty:
	mkdir -p $(shell dirname ${_ALACRITTY})
	ln -fs ${PWD}/alacritty.yml ${_ALACRITTY}

tmux:
	mkdir -p $(shell dirname ${_TMUX})
	ln -fs ${PWD}/tmux.conf ${_TMUX}
