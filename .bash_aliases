if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

#=== adding colors ===#
alias ls='ls -hN --color=auto --group-directories-first'
alias ccat="highlight --out-format=ansi" # Color cat - print file with syntax highlighting.
alias grep="grep --color=auto"
alias diff="diff --color=auto"


#=== short commands ===#
alias usc='cat /media/d/useful_commands.txt | less'
alias books='cd /media/d/documents/school/books'
alias sof='cd /media/d/softwares/'
alias wpf='cd ~/.wine/drive_c/Program\ Files'
alias blur='python m blur_image'
alias pi='sudo pacman -S'
alias clla='clear; ll -a'
alias find='sudo find'
alias cll='clear; ll'
alias yi='yaourt -S'
alias cd..='cd ..'
alias la='ls -la'
alias ll='ls -lX'

#=== scripts ===#
alias colors='python -m colors_terminal'
alias dic='python -m cambridge_dict'
alias todo='python -m todo'
alias vpn='bash connect_vpnbook.sh'
alias qr='generate_qrimage.sh'
alias clc='clc.sh'

#=== softwares ===#
alias itunes='.wine/drive_c/Program\ Files/iTunes/iTunes.exe'
alias r='ranger'
alias v='vim'
alias vf='vim $(fzf)'
alias f='$(fzf)'
alias vpnpass='python -m vpnbook_password_get s'
alias grwbot='cd /media/d/softwares/my_creation/grow; python growbot.py'
