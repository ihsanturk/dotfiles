fp=~/.aliases
if ! [ -r $fp ]; then
	echo "$fp not found!"
	exit 1
fi

if ! [ "$2" ] && ! [ "$1" ]; then
	echo "You should type the alias and command."
elif ! [ "$2" ]; then
	echo "You should type the command."
else
	#=== If everythings right ===#
	printf "[OK]\n"
	echo "alias ${1}='${2}'" >> $fp 
	tail $fp -n 1
fi
