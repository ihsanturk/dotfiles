# { stdenv, docopts, fetchurl, tesseract }:
# stdenv.mkDerivation rec {

{ pkgs ? import <nixpkgs> {} }:
with pkgs; stdenv.mkDerivation rec {

	name = "img2txt";
	src = ./img2txt;

	phases = [ "installphase" "postFixup" ];
	nativeBuildInputs = [ makeWrapper ];
	wrapperPath = with stdenv.lib; makeBinPath ([
		docopts
		tesseract
	]);

	installPhase = ''
		mkdir -p $out/bin
		cp ${src} $out/bin/${name}
		chmod +x $out/bin/${name}
	'';

	postFixup = ''
		wrapProgram $out/bin/${name} $wrapperfile --prefix PATH : "${wrapperPath}"
	'';

}

