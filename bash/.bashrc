#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#=== PS1 ===#
function PS1_()
{
    local lastexit=$?
    (( lastexit )) && g_PS1_Qcolor=1 || g_PS1_Qcolor=65
    return $lastexit
}
PROMPT_COMMAND=PS1_
export PS1='\
\[$(tput bold)\]\
\[$(tput setaf ${g_PS1_Qcolor})\][\
\[$(tput setaf 3)\]\W\
\[$(tput setaf ${g_PS1_Qcolor})\]]\
\[$(tput bold)\]\
\[$(tput setaf ${g_PS1_Qcolor})\] \\$ \
\[$(tput sgr0)\]\
'

export PATH="$PATH:$(du "$HOME/sof/ihsn/useful/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export BROWSER="chromium"
export SHELL="/bin/bash"
export TERMINAL="screen-256color-bce"
export READER="mupdf"
export EDITOR="nvim"
export VISUAL="nvim"
export FZF_DEFAULT_OPTS="--height 70% --layout=reverse"
export LC_CTYPE=en_GB.UTF-8
export LANG=en_GB.UTF-8
export NNN_TMPFILE=/tmp/nnn

if [ -f $HOME/.alias ]; then source $HOME/.alias; fi
source "$HOME/col/gruvbox_256palette.sh"
source "$HOME/.inputrc"
source "$HOME/.func"

#=== options ===#
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;33m") \
    LESS_TERMCAP_md=$(printf "\e[1;33m") \
    LESS_TERMCAP_me=$(printf "\e[2;35m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[2;30;46m") \
    LESS_TERMCAP_ue=$(printf "\e[0;36m") \
    LESS_TERMCAP_us=$(printf "\e[2;33m") \
    man "$@"
}

#=== shopt ===#
shopt -s checkwinsize
stty -ixon #Disable ctrl-s and ctrl-q

#=== history ===#
HISTSIZE=			  #infinite
HISTFILESIZE=		#infinite
LESSHISTFILE=-

#=== auto completion ===#
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		source /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		source /etc/bash_completion
	fi
fi
#bind TAB:menu-complete
