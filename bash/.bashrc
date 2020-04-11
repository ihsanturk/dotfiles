#!/bin/sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1 {{{1

PS1_() {
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

# }}}
# Source {{{1

[ -f $HOME/.alias ] && . $HOME/.alias
. "$HOME/.inputrc"
. "$HOME/.func"

# }}}
# Shopt {{{1

shopt -s checkwinsize
stty -ixon # Disable ctrl-s and ctrl-q

# Auto completion {{{2

if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		source /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		source /etc/bash_completion
	fi
fi
#bind TAB:menu-complete

# }}}

# }}}
