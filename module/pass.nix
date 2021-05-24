{ config, lib, pkgs, ... }:
{

	programs.password-store.enable = true;
	programs.password-store.settings.PASSWORD_STORE_DIR = "$HOME/.password-store";
	programs.password-store.settings.PASSWORD_STORE_KEY = "467DD48CFC891A65";
	programs.password-store.package = pkgs.pass.withExtensions (exts: [
		exts.pass-otp
	]);

}


