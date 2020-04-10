# =========================================================================== #
# File:        .zshrc                                                         #
# Author:      ihsan <ihsanl at pm dot me>                                    #
# Updated At:  1586553056                                                     #
# License:     MIT License                                                    #
# =========================================================================== #

autoload -U compinit && compinit
fpath=(~/.zsh/completions $fpath)
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' '+l:|=* r:|=*'

setopt hist_ignore_dups
setopt auto_menu
set -o emacs
unset LSCOLORS

. $HOME/.func
. $HOME/.alias
. $HOME/.fzf.zsh
. $HOME/.profile
. $HOME/.abbrev.zsh
. $HOME/.secret.credentials
. $HOME/.zinit/bin/zinit.zsh

### Added by Zinit's installer
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
### End of Zinit installer's chunk

# Plugins
setopt promptsubst
zinit ice wait lucid
zinit snippet OMZ::lib/completion.zsh
zinit ice wait atinit"zpcompinit" lucid
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light https://gitlab.com/code-stats/code-stats-zsh/-/raw/master/codestats.plugin.zsh
zinit ice wait atload"unalias grv" lucid
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/git.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/spectrum.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit ice wait'!' lucid
zinit snippet OMZ::themes/robbyrussell.zsh-theme
zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
	zsh-users/zsh-completions
zinit light https://github.com/agkozak/zsh-z/blob/master/zsh-z.plugin.zsh
