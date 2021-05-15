{ pkgs, ... }:
{
	home.packages = with pkgs; [

		gcc
		llvm
		# clang_10
		# llvmPackages.clang-unwrapped

	];

}
