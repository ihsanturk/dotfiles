{ stdenv, lib, makeWrapper, fetchurl, jq, w3m, curl }:
stdenv.mkDerivation rec {

	name = "tmpmail";
	src = fetchurl {
		url = "https://git.io/tmpmail";
		sha256 = "sha256-BL5E7t78BBCbUhErh/kyRU50TVGzOYvYUkaFO+7qu54=";
	};

	phases = [ "installphase" "postFixup" ];
	nativeBuildInputs = [ makeWrapper ];
	wrapperPath = with stdenv.lib; makeBinPath ([
		jq
		w3m
		curl
	]);

	installphase = ''
		mkdir -p $out/bin
		cp ${src} $out/bin/${name}
		chmod +x $out/bin/${name}
	'';

	postFixup = ''
		wrapProgram $out/bin/${name} $wrapperfile --prefix PATH : "${wrapperPath}"
	'';

}
