{ stdenv, lib, makeWrapper, fetchurl, jq, w3m, curl }:
stdenv.mkDerivation rec {

	name = "tmpmail";
	src = fetchurl {
		url = "https://git.io/tmpmail";
		sha256 = "1prqm099w8js4139xk5p1wm771zk0a06aq7bas1dhs8cbrj9z349";
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
