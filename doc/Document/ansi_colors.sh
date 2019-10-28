#!/bin/sh

fgblk='\033[0;30m' # Black - Regular
fgred='\033[0;31m' # Red
fggrn='\033[0;32m' # Green
fgylw='\033[0;33m' # Yellow
fgblu='\033[0;34m' # Blue
fgpur='\033[0;35m' # Purple
fgcyn='\033[0;36m' # Cyan
fgwht='\033[0;37m' # White

bdblk='\033[1;30m' # Black - Bold
bdred='\033[1;31m' # Red
bdgrn='\033[1;32m' # Green
bdylw='\033[1;33m' # Yellow
bdblu='\033[1;34m' # Blue
bdpur='\033[1;35m' # Purple
bdcyn='\033[1;36m' # Cyan
bdwht='\033[1;37m' # White

ulblk='\033[4;30m' # Black - underline
ulred='\033[4;31m' # Red
ulgrn='\033[4;32m' # Green
ulylw='\033[4;33m' # Yellow
ulblu='\033[4;34m' # Blue
ulpur='\033[4;35m' # Purple
ulcyn='\033[4;36m' # Cyan
ulwht='\033[4;37m' # White

bgblk='\033[40m'   # Black - Background
bgred='\033[41m'   # Red
bggrn='\033[42m'   # Green
bgylw='\033[43m'   # Yellow
bgblu='\033[44m'   # Blue
bgpur='\033[45m'   # Purple
bgcyn='\033[46m'   # Cyan
bgwht='\033[47m'   # White
fgrst='\033[0m'    # Text Reset


# Tput

bgBlack=$(tput setab 0) # black
bgRed=$(tput setab 1) # red
bgGreen=$(tput setab 2) # green
bgYellow=$(tput setab 3) # yellow
bgBlue=$(tput setab 4) # blue
bgMagenta=$(tput setab 5) # magenta
bgCyan=$(tput setab 6) # cyan
bgWhite=$(tput setab 7) # white

# foreground color using ANSI escape

fgBlack=$(tput setaf 0) # black
fgRed=$(tput setaf 1) # red
fgGreen=$(tput setaf 2) # green
fgYellow=$(tput setaf 3) # yellow
fgBlue=$(tput setaf 4) # blue
fgMagenta=$(tput setaf 5) # magenta
fgCyan=$(tput setaf 6) # cyan
fgWhite=$(tput setaf 7) # white

# text editing options

txBold=$(tput bold)   # bold
txHalf=$(tput dim)    # half-bright
txUnderline=$(tput smul)   # underline
txEndUnder=$(tput rmul)   # exit underline
txReverse=$(tput rev)    # reverse
txStandout=$(tput smso)   # standout
txEndStand=$(tput rmso)   # exit standout
txReset=$(tput sgr0)   # reset attributes
