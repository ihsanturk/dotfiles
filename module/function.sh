# code() { # using github.com/zimbatm/h
# 	target=$(echo "$1" | sed 's:^ihsanturk/::g')
# 	target=$DIR_CODE/ihsanturk/$1
# 	[ -d $target ] || $target | expand gitrepo
# 	cd "$target"
# }
learn() { cd $DIR_LEARN/$1; }
zk() {
	cd ~/zk && case $1 in
		(n|ne|new) nvim +norm\ gzn;;
		(s|se|sea|sear|search) nvim +norm\ gzz;;
	esac
}
