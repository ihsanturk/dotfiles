config: {

	# nix
	ns = "nix-shell --command zsh"; # FIXME: make pure;

	# git
	g = "git";
	ga = "git add";
	gd = "git diff";
	glo = "git log";
	gb = "git branch";
	gcl = "git clone";
	gs = "git status";
	gp = "git push -u";
	gc = "git commit -v";

	# exa
	l = "exa";
	sl = "exa";
	ll = "exa -l";
	ls = "clear;echo; exa -l";

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
	t="tweet";
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
	nixpkgs="nix-env -qaP | cut -d' ' -f1";
	find-executables="find . -perm +111 -type f";
	# watch="watch -cn0.1"; # not compatible with fish
	captiveloop="until captive -i | grep -m 1 \"Success\";do:;done";
	homemanagerpkgs="open https://github.com/rycee/home-manager/find/master";

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

}
