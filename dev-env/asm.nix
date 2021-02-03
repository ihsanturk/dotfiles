{ pkgs, ... }:
{
	home.packages = with pkgs; [

		nasm # compile with `nasm -o hello.com hello.asm`
		dosbox # run with `dosbox hello.com`

	];

}
