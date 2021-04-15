learn() { cd $DIR_LEARN/$1; }
ls-() { ls --color=auto -$1; }

zk() {
	cd ~/zk && case $1 in
		(n|ne|new) nvim +norm\ gzn;;
		(s|se|sea|sear|search) nvim +norm\ gzz;;
	esac
}

