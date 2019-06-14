#
# ~/.zshrc
#

ZSH_THEME="robbyrussell"
#DISABLE_LS_COLORS="true"
DISABLE_UPDATE_PROMPT="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

LESSHISTFILE=-
HISTSIZE=5000000
SAVEHIST=5000000
HISTFILE=~/.zsh_history

plugins=(
	z
	git
	vi-mode
	zsh-completions
	zsh-syntax-highlighting
)
autoload -U compinit && compinit

export KEYTIMEOUT=1
export LANG=en_GB.UTF-8
export EDITOR=$(which nvim)
export LC_CTYPE=en_GB.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export TERMINAL="st-256color"
export PATH="$PATH:${HOME}/.local/bin"
export PKG_CONFIG_PATH="/lib/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig"
export PATH="$PATH:$(du "${HOME}/sof/ihsn/useful/" | cut -f2 | grep -v '\.git' | tr '\n' ':' | sed 's/:*$//')"
export PATH="/usr/local/sbin:$PATH"

source ${HOME}/.func
source ${HOME}/.alias
source $ZSH/oh-my-zsh.sh
