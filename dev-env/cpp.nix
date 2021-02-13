{ pkgs, ... }:
{
	home.packages = with pkgs; [

		llvm
		clang_10

	];

}
