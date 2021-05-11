learn() { cd $DIR_LEARN/$1; }
ls-() {
	if [ -n "$1" ]; then
		eval '$(ls --color=auto -)'$1;
	else
		ls --color=auto;
	fi
}

zk() {
	cd ~/zk && case $1 in
		(n|ne|new) nvim +norm\ gzn;;
		(s|se|sea|sear|search) nvim +norm\ gzz;;
	esac
}

