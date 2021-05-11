learn() { cd $DIR_LEARN/$1; }

ls-() {
	if [ -n "$1" ]; then
		eval '$(ls --color=auto -)'$1;
	else
		ls --color=auto;
	fi
}

