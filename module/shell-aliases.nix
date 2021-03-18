config: {

	# git
	g = "git";
	ga = "git add";
	gl = "git log";
	gd = "git diff";
	gb = "git branch";
	gcl = "git clone";
	gp = "git push -u";
	gc = "git commit -v";
	gs = "git status -s";
	gitopen = "open $(git remote get-url --push origin)";
	# gitopen = "xdg-open $(git remote get-url --push origin)"; # for linux;

	# exa
	l = "exa";
	ls = "exa";
	sl = "exa";
	ll = "exa -l";
	lsd = "exa -D";
	ls-l = "exa -l";

	# vim
	":q" = "exit";
	":w" = "sync";
	":bd" = "exit";
	":E" = "$EDITOR";
	":e" = "$EDITOR";
	":sp" = "nvr +:sp";
	":vs" = "nvr +:vs";
	":wq" = "sync; exit";
	":tabe" = "nvr +:tabe";

	# cd
	".." = "cd ..";
	"cd.." = "cd ..";
	"..." = "cd ..; cd ..";

	# base
	la="ls -a";
	mv="mv -n";
	rm="trash";
	E="$EDITOR";
	e="$EDITOR";
	pup="pup -p";
	tp="todaysplan";
	cpwd="pwd | pbcopy";
	grep="grep --color=auto";
	timestamp="date +%s"; ts="date +%s";
	mp3="youtube-dl -x --audio-format mp3";
	find-executables="find . -perm +111 -type f";
	t="tweet"; # not acutally twitter.com! Just a custom log script.

	# typo
	c="cd";
	q="exit";
	gti="git";
	eix="exit";
	exi="exit";
	les="less";
	ter="tree";
	tre="tree";
	eitx="exit";
	eixt="exit";
	exti="exit";
	iext="exit";
	ixet="exit";
	rtee="tree";
	xeit="exit";
	teixt="exit";

	# stale
	# ns = "nix-shell --command zsh"; 
	# nixpkgs="nix-env -qaP | cut -d' ' -f1";
	# watch="watch -cn0.1"; # not compatible with fish
	# captiveloop="until captive -i | grep -m 1 \"Success\";do:;done";
	# homemanagerpkgs="open https://github.com/rycee/home-manager/find/master";

}
