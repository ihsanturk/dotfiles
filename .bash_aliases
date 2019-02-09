if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

#=== adding colors ===#
alias ls='ls -hN --color=auto --group-directories-first'
alias ccat="highlight --out-format=ansi" # Color cat - print file with syntax highlighting.
alias grep="grep --color=auto"
alias diff="diff --color=auto"


#=== short commands ===#
alias edc='cat /media/d/every_day_commands.txt | less'
alias books='cd /media/d/documents/school/books'
alias sof='cd /media/d/softwares/my_creation/'
alias wpf='cd ~/.wine/drive_c/Program\ Files'
alias pi='sudo pacman -S'
alias yi='yaourt -S'
alias cd..='cd ..'
alias ll='ls -lX'
alias cll='clear; ll'
alias clla='clear; ll -a'

#=== scripts ===#
alias dic='python3 -m cambridge_dict'
alias vpn='bash connect_vpnbook.sh'
alias qr='generate_qrimage.sh'

#=== softwares ===#
alias itunes='.wine/drive_c/Program\ Files/iTunes/iTunes.exe'
alias clc='clc.sh'
alias r='ranger'
alias v='vim'
alias pip='pip --user'
alias blur='python m blur_image'
alias pip3='pip3 --user'
alias la='ls -la'
alias find='sudo find'
