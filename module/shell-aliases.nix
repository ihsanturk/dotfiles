{

	# git
	g       = "git";
	ga      = "git add";
	gb      = "git branch";
	gc      = "git commit -v";
	gcl     = "git clone";
	gd      = "git diff";
	gitopen = "open $(git remote get-url --push origin)";
	gl      = "git log";
	gp      = "git push -u";
	gs      = "git status -s";

	# gitopen = "xdg-open $(git remote get-url --push origin)"; # for linux;

	# # exa
	# l    = "exa";
	# ll   = "exa -l";
	# ls   = "exa";
	# ls-l = "exa -l";
	# lsd  = "exa -D";
	# sl   = "exa";

	# ls (-G only works for macOS)
	l    = "ls --color=auto";
	ll   = "ls --color=auto -l";
	ls   = "ls --color=auto";
	ls-l = "ls --color=auto -l";
	sl   = "ls --color=auto";

	# cd
	".."   = "cd ..";
	"..."  = "cd ..; cd ..";
	"cd.." = "cd ..";

	# base
	E                = "$EDITOR";
	aco              = "ansicolor";
	cpwd             = "pwd | pbcopy";
	e                = "$EDITOR";
	find-executables = "find . -perm +111 -type f";
	grep             = "grep --color=auto";
	la               = "ls -a";
	mp3              = "youtube-dl -x --audio-format mp3";
	mv               = "mv -n";
	pup              = "pup -p";
	rm               = "trash";
	t                = "tweet"; # not acutally twitter.com! Just a custom log script.
	timestamp        = "date +%s";
	ts               = "date +%s";
	tp               = "todaysplan";

	# typo
	c     = "cd";
	eitx  = "exit";
	eix   = "exit";
	eixt  = "exit";
	exi   = "exit";
	exti  = "exit";
	gti   = "git";
	iext  = "exit";
	ixet  = "exit";
	les   = "less";
	q     = "exit";
	rtee  = "tree";
	teixt = "exit";
	ter   = "tree";
	tre   = "tree";
	xeit  = "exit";

}
