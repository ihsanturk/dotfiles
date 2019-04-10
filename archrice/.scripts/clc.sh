clear
ans=$(printf "print($1)" | python)
printf "\e[1;37m[\e[1;33m~\e[1;37m]$ clc.sh $1 = \e[1;32m$ans\n"
