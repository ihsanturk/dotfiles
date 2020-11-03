self: super:

with super;

let

	# fullgaps = fetchurl {
	# 	url = "http://dwm.suckless.org/patches/fullgaps/dwm-fullgaps-6.2.diff";
	# 	sha1 = "sc23xxpg5zp31z3z7sym5g9sv03109pn";
	# };

in
	{
		dwm = dwm.override {
			patches = [

				./patch/dwm-modkey.diff
				./patch/dwm-colorbar-6.2.diff
				./patch/dwm-fullgaps-6.2.diff
				./patch/dwm-fakefullscreen-20170508-ceac8c9.diff
				./patch/dwm-nomonocleborders-20190607-cb3f58a.diff

				./patch/dwm-config.diff

			];
		};
	}
