#
# ~/.zshrc
#

export PS1="`tput bold;tput setaf 2`➜`tput setaf 3`  %1~`tput sgr0` "
export PROMPT="`tput bold;tput setaf 2`➜`tput setaf 3`  %1~`tput sgr0` "
LESSHISTFILE=-
HISTSIZE=9000000
SAVEHIST=9000000
HISTFILE=~/.zsh_history

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' '+l:|=* r:|=*'
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

setopt hist_ignore_dups
setopt auto_menu

set -o emacs
unset LSCOLORS
export CLICOLOR=1
export KEYTIMEOUT=1
export EDITOR='nvim'
export VISUAL='nvim'
export MYSQL_PWD=root
export CLICOLOR_FORCE=1
export GIN_MODE=release
export LANG=en_GB.UTF-8
export GOPATH="$HOME/go"
export LC_ALL=en_GB.UTF-8
export PATH="$GOPATH/bin:$PATH"
export FZF_ALT_C_OPTS="--height 5%"
export PATH="$HOME/.local/bin:$PATH"
export ZPLUG_HOME=/usr/local/opt/zplug
export PATH="/usr/local/opt/m4/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export SSLKEYLOGFILE="$HOME/SSLKeyLogFile"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openblas/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export PATH="$HOME/Library/Python/3.7/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openblas/include"
export PATH="/usr/local/opt/protobuf@3.7/bin:$PATH"
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
export FZF_CTRL_R_OPTS="--height 0% --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

source $HOME/.func
source $HOME/.alias
source $HOME/.fzf.zsh
source $HOME/.profile
source $HOME/.abbrev.zsh
source $HOME/.secret.credentials
source $HOME/.zinit/bin/zinit.zsh

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
