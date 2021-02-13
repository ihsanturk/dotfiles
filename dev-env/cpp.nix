{ pkgs, ... }:
{
	home.packages = with pkgs; [

		llvm
		clang-unwrapped

	];

}
