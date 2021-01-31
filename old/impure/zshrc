# =============================================================================
# File:        .zshrc
# Author:      ihsan <ihsanl at pm dot me>
# Updated At:  1586553056
# License:     MIT License
# =============================================================================

tic ~/Code/github.com/mawww/kakoune/contrib/tmux-256color.terminfo

set -o emacs
setopt appendhistory
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' '+l:|=* r:|=*'

autoload -U select-word-style
select-word-style bash

. $HOME/.func
. $HOME/.alias
. $HOME/.profile
. $HOME/.abbrev.zsh
. $HOME/.secret.credentials
. $HOME/.zinit/bin/zinit.zsh

# Added by Zinit's installer {{{1

if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
	print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
	command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
	command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
		print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
		print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### End of Zinit installer's chunk }}}
# Aded by ghcup installer {{{1

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] &&
	source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

# }}}
# Plugins {{{1

zinit ice wait atinit"zpcompinit" lucid
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light https://gitlab.com/code-stats/code-stats-zsh/-/raw/master/codestats.plugin.zsh
zinit wait lucid atload"zicompinit; zicdreplay" blockf for zsh-users/zsh-completions
zinit light rupa/z
zinit light https://raw.githubusercontent.com/denisidoro/navi/master/shell/navi.plugin.zsh

eval "$(starship init zsh)"

# }}}

# : vim: set fdm=marker :
