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
alias sof='cd /media/d/softwares/my_creation/'
alias wpf='cd ~/.wine/drive_c/Program\ Files'
alias blur='python m blur_image'
alias pi='sudo pacman -S'
alias clla='clear; ll -a'
alias pip3='pip3 --user'
alias find='sudo find'
alias pip='pip --user'
alias cll='clear; ll'
alias yi='yaourt -S'
alias cd..='cd ..'
alias la='ls -la'
alias ll='ls -lX'

#=== scripts ===#
alias dic='python3 -m cambridge_dict'
alias vpn='bash connect_vpnbook.sh'
alias qr='generate_qrimage.sh'
alias clc='clc.sh'

#=== softwares ===#
alias itunes='.wine/drive_c/Program\ Files/iTunes/iTunes.exe'
alias r='ranger'
alias v='vim'
