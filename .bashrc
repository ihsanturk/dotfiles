#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#=== PS1 ===#
function _PS1_command()
{
    local lastexit=$?
    (( lastexit )) && g_PS1_Qcolor=1 || g_PS1_Qcolor=65
    return $lastexit
}

PROMPT_COMMAND=_PS1_command
export PS1='\
\[$(tput bold)\]\
\[$(tput setaf ${g_PS1_Qcolor})\][\
\[$(tput setaf 3)\]\W\
\[$(tput setaf ${g_PS1_Qcolor})\]]\
\[$(tput bold)\]\
\[$(tput setaf ${g_PS1_Qcolor})\]\\$ \
\[$(tput sgr0)\]\
'

#=== colors ===#
source "/media/d/colors/gruvbox_256palette.sh"

#=== inputrc ===#
source "$HOME/.inputrc"

#=== PATHs ===#
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/media/d/softwares/google-cloud-sdk/google-cloud-sdk/path.bash.inc' ]; then
    . '/media/d/softwares/google-cloud-sdk/google-cloud-sdk/path.bash.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/media/d/softwares/google-cloud-sdk/google-cloud-sdk/completion.bash.inc' ]; then
    . '/media/d/softwares/google-cloud-sdk/google-cloud-sdk/completion.bash.inc'; fi
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PYTHONPATH="${PYTHONPATH}:$(du "/media/d/softwares/my_creation/useful/python/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export CUDA_HOME=/opt/cuda
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/cuda/lib64"
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export PKG_CONFIG_PATH=":/usr/lib/pkgconfig:/usr/lib64/pkgconfig"


#=== default apps ===#
export BROWSER="google-chrome-stable"
export SHELL="/bin/zsh"
export TERMINAL="urxvt"
export READER="mupdf"
export EDITOR="vim"
export VISUAL="vim"


#=== options ===#
export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --preview 'head -75 {}'"
export LC_CTYPE=en_GB.UTF-8
export LANG=en_GB.UTF-8


man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;33m") \
        LESS_TERMCAP_md=$(printf "\e[1;33m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[2;43;30m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;33m") \
        man "$@"
}


#=== shopt ===#
shopt -s checkwinsize
stty -ixon #Disable ctrl-s and ctrl-q


#=== history ===#
HISTSIZE= 		#infinite
HISTFILESIZE= 	#infinite
LESSHISTFILE=-


#=== custom aliases ===#
if [ -f ~/.aliases ]; then
	. ~/.aliases
fi


#=== auto completion ===#
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi


#=== default directory ===#
#todo
#cd ~
