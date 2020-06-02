# =============================================================================
# File:        .zshrc
# Author:      ihsan <ihsanl at pm dot me>
# Updated At:  1586553056
# License:     MIT License
# =============================================================================

set -o emacs
setopt hist_ignore_dups
setopt hist_ignore_space
setopt appendhistory
setopt share_history
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' '+l:|=* r:|=*'

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
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light https://gitlab.com/code-stats/code-stats-zsh/-/raw/master/codestats.plugin.zsh
zinit wait lucid atload"zicompinit; zicdreplay" blockf for zsh-users/zsh-completions
zinit light rupa/z
zinit light https://raw.githubusercontent.com/denisidoro/navi/master/shell/navi.plugin.zsh

eval "$(starship init zsh)"

# }}}
# FORSAKEN {{{1

# setopt promptsubst
# setopt MENU_COMPLETE
# zinit light dfurnes/purer
# zstyle :prompt:pure:git:stash show yes
# zinit ice pick"async.zsh" src"pure.zsh"

# OhMyZsh {{{2

# zinit snippet OMZ::lib/spectrum.zsh
# zinit snippet OMZ::plugins/git/git.plugin.zsh

# }}}
# Rust Slick Prompt {{{2

# export SLICK_PROMPT_CMD_MAX_EXEC_TIME=3
# export SLICK_PROMPT_ERROR_COLOR=88
# export SLICK_PROMPT_GIT_ACTION_COLOR=1
# export SLICK_PROMPT_GIT_BRANCH_COLOR=5
# export SLICK_PROMPT_GIT_FETCH=0
# export SLICK_PROMPT_GIT_MASTER_BRANCH_COLOR=white
# export SLICK_PROMPT_GIT_REMOTE_COLOR=40
# export SLICK_PROMPT_GIT_STAGED_COLOR=1
# export SLICK_PROMPT_GIT_STATUS_COLOR=cyan
# export SLICK_PROMPT_PATH_COLOR=11
# export SLICK_PROMPT_ROOT_COLOR=red
# export SLICK_PROMPT_ROOT_SYMBOL="#"
# export SLICK_PROMPT_SSH_COLOR=2
# export SLICK_PROMPT_SYMBOL="$"
# export SLICK_PROMPT_SYMBOL_COLOR=magenta
# export SLICK_PROMPT_TIME_ELAPSED_COLOR=1
# export SLICK_PROMPT_VICMD_COLOR="yellow"
# export SLICK_PROMPT_VICMD_SYMBOL="❮"
# zle -N zle-keymap-select
# zle -N zle-line-init
# zmodload zsh/datetime
# autoload -Uz add-zsh-hook
# add-zsh-hook precmd slick_prompt_precmd
# add-zsh-hook preexec slick_prompt_preexec
# typeset -g slick_prompt_data
# typeset -g slick_prompt_timestamp
# SLICK_PATH=$HOME/.cargo/bin/slick
# function slick_prompt_refresh {
#     local exit_status=$?
#     read -r -u $1 slick_prompt_data
#     PROMPT=$($SLICK_PATH prompt -k "$KEYMAP" -r $exit_status -d ${slick_prompt_data:-""} -t ${slick_prompt_timestamp:-$EPOCHSECONDS})
#     unset slick_prompt_timestamp
#     zle reset-prompt
#     # Remove the handler and close the fd
#     zle -F $1
#     exec {1}<&-
# }
# function zle-line-init zle-keymap-select {
#     PROMPT=$($SLICK_PATH prompt -k "$KEYMAP" -d ${slick_prompt_data:-""})
#     zle && zle reset-prompt
# }
# function slick_prompt_precmd() {
#     slick_prompt_data=""
#     local fd
#     exec {fd}< <($SLICK_PATH precmd)
#     zle -F $fd slick_prompt_refresh
# }
# function slick_prompt_preexec() {
#     slick_prompt_timestamp=$EPOCHSECONDS
# }

# }}}

# }}}

# : vim: set fdm=marker :
