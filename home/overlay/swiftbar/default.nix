{ stdenv, fetchzip }:

let
	name = "SwiftBar";
	pname = "swiftbar";
	version = "1.1.1";
	repo = "https://github.com/swiftbar/SwiftBar";
in
stdenv.mkDerivation {
	inherit pname version;

	src = fetchzip {
		url = "${repo}/releases/download/v${version}/${name}.zip";
		sha256 = "sha256-5lcfHuw3hzBSRuXILfcgc8PpN9juhtWyY/ZxnP7Xurc=";
	};

	# see: https://github.com/LnL7/nix-darwin/issues/214
	# see: https://github.com/ryanorendorff/nix-configs/blob/dd37103957a437cad5665467ea0cd9d1467672fe/pkgs/darwinApps/default.nix
	installPhase = ''
		mkdir -p "$out/Applications/${name}.app"
		cp -R . "$out/Applications/${name}.app"
		chmod +x "$out/Applications/${name}.app/Contents/MacOS/${name}"
		cp -R "$out/Applications/${name}.app" "/Applications/${name}.app"
	'';

	meta = {
		description = "Powerful macOS menu bar customization tool";
		homepage = "https://swiftbar.app";
		license = stdenv.lib.licenses.mit;
		platforms = stdenv.lib.platforms.darwin;
	};

}
