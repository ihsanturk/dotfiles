{ pkgs, ... }:
rec {

	home.packages = with pkgs; [

		gnuplot
		datamash

	];
}
