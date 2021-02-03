self: super:
let require = path: args: super.callPackage (import path) args;
in {

	trends = require ./trends {};
	tmpmail = require ./tmpmail {};
	quickjs = require ./quickjs {};
	swiftbar = require ./swiftbar {};
	# img2txt = require ./img2txt {}; # requires docopts

}
