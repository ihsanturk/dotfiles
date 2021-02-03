default:
	[ ! -f patch/st-config.diff ] || mv patch/st-config.diff /tmp/st-config.diff.bak
	diff -up a/ b/ > patch/st-config.diff; [ $$? -eq 1 ]
