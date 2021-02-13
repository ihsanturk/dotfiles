{ pkgs, ... }:
{
	home.packages = with pkgs; [

		llvm
		clang_10
		llvmPackages.clang-unwrapped

	];

}
