{ config, lib, pkgs, ... }:
let
	color = config.settings.color;
in {

	programs.alacritty = {
		enable = true;
		settings = {
			window = {

				dimensions = {
					columns = 84; # 169;
					lines   = 34; # 47;
				};

				padding = {
					x = 0;
					y = 0;
				};

				dynamic_padding = false;
				decorations     = "Buttonless";

			};

			add_newline = false;

			scrolling = {
				history = 0;
				# multiplier = 3;
			};

			font = {
				normal = {
					family = "FiraCode Nerd Font";
					style  = "Regular";
				};
				bold = {
					family = "FiraCode Nerd Font";
					style  = "Bold";
				};
				italic = {
					family = "FiraCode Nerd Font";
					style  = "Italic";
				};
				size             = 13; # not float aware :/
				use_thin_strokes = true;
			};

			draw_bold_text_with_bright_colors = false;

			colors = {
				primary = {
					background = "0x1D2021"; # color.bg;
					foreground = "0xEBDBB2"; # color.fg;
				};

				normal = {
					black   = "0x282828";
					red     = "0xCC241D";
					green   = "0x98971A";
					yellow  = "0xD79921";
					blue    = "0x458588";
					magenta = "0xB16286";
					cyan    = "0x689D6A";
					white   = "0xA89984";
				};

				bright = {
					black   = "0x928374";
					red     = "0xFB4934";
					green   = "0xB8BB26";
					yellow  = "0xFABD2F";
					blue    = "0x83A598";
					magenta = "0xD3869B";
					cyan    = "0x8EC07C";
					white   = "0xEBDBB2";
				};
			};

			bell = {
				animation = "EaseOutExpo";
				duration = 0;
				color = "0xeeeeee";
			};

			background_opacity = 1.0;

			mouse = {
				hide_when_typing = true;
			};

			cursor = {
				style = "Block";
			};

			live_config_reload = true;
			alt_send_esc = false;

			key_bindings = [

				# tmux (NOTE: requires c-g (\x07) as tmux prefix) use `xxd -psd`
				{ key = "O";    mods = "Command"; chars = "\\x07\\x6f"; }
				{ key = "T";    mods = "Command"; chars = "\\x07\\x63"; }
				{ key = "K";    mods = "Command"; chars = "\\x07\\x18"; }
				{ key = "S";    mods = "Command"; chars = "\\x07\\x22"; }
				{ key = "D";    mods = "Command"; chars = "\\x07\\x25"; }
				{ key = "L";    mods = "Command"; chars = "\\x07\\x6c"; }
				# { key = "Key0"; mods = "Command"; chars = "\\x07\\x30"; }
				{ key = "Key1"; mods = "Command"; chars = "\\x07\\x31"; }
				{ key = "Key2"; mods = "Command"; chars = "\\x07\\x32"; }
				{ key = "Key3"; mods = "Command"; chars = "\\x07\\x33"; }
				{ key = "Key4"; mods = "Command"; chars = "\\x07\\x34"; }
				{ key = "Key5"; mods = "Command"; chars = "\\x07\\x35"; }
				{ key = "Key6"; mods = "Command"; chars = "\\x07\\x36"; }
				{ key = "Key7"; mods = "Command"; chars = "\\x07\\x37"; }
				{ key = "Key8"; mods = "Command"; chars = "\\x07\\x38"; }
				{ key = "Key9"; mods = "Command"; chars = "\\x07\\x39"; }

				{ key = "Z"; mods = "Alt"; chars = "\\x1Bz"; }
				{ key = "N"; mods = "Command"; action = "SpawnNewInstance"; }
				{ key = "Period"; mods = "Alt"; chars = "\\x1B."; }
				{ key = "Period"; mods = "Alt|Shift"; chars = "\\x1B>"; }
				{ key = "A"; mods = "Alt"; chars = "\\x1Ba"; }
				{ key = "A"; mods = "Alt|Shift"; chars = "\\x1BA"; }
				{ key = "B"; mods = "Alt"; chars = "\\x1Bb"; }
				{ key = "B"; mods = "Alt|Shift"; chars = "\\x1BB"; }
				{ key = "C"; mods = "Alt"; chars = "\\x1Bc"; }
				{ key = "C"; mods = "Alt|Shift"; chars = "\\x1BC"; }
				{ key = "D"; mods = "Alt"; chars = "\\x1Bd"; }
				{ key = "D"; mods = "Alt|Shift"; chars = "\\x1BD"; }
				{ key = "E"; mods = "Alt"; chars = "\\x1Be"; }
				{ key = "E"; mods = "Alt|Shift"; chars = "\\x1BE"; }
				{ key = "F"; mods = "Alt"; chars = "\\x1Bf"; }
				{ key = "F"; mods = "Alt|Shift"; chars = "\\x1BF"; }
				{ key = "G"; mods = "Alt"; chars = "\\x1Bg"; }
				{ key = "G"; mods = "Alt|Shift"; chars = "\\x1BG"; }
				{ key = "H"; mods = "Alt"; chars = "\\x1Bh"; }
				{ key = "H"; mods = "Alt|Shift"; chars = "\\x1BH"; }
				{ key = "I"; mods = "Alt"; chars = "\\x1Bi"; }
				{ key = "I"; mods = "Alt|Shift"; chars = "\\x1BI"; }
				{ key = "J"; mods = "Alt"; chars = "\\x1Bj"; }
				{ key = "J"; mods = "Alt|Shift"; chars = "\\x1BJ"; }
				{ key = "K"; mods = "Alt"; chars = "\\x1Bk"; }
				{ key = "K"; mods = "Alt|Shift"; chars = "\\x1BK"; }
				{ key = "L"; mods = "Alt"; chars = "\\x1Bl"; }
				{ key = "L"; mods = "Alt|Shift"; chars = "\\x1BL"; }
				{ key = "M"; mods = "Alt"; chars = "\\x1Bm"; }
				{ key = "M"; mods = "Alt|Shift"; chars = "\\x1BM"; }
				{ key = "N"; mods = "Alt"; chars = "\\x1Bn"; }
				{ key = "N"; mods = "Alt|Shift"; chars = "\\x1BN"; }
				{ key = "O"; mods = "Alt"; chars = "\\x1Bo"; }
				{ key = "O"; mods = "Alt|Shift"; chars = "\\x1BO"; }
				{ key = "P"; mods = "Alt"; chars = "\\x1Bp"; }
				{ key = "P"; mods = "Alt|Shift"; chars = "\\x1BP"; }
				{ key = "Q"; mods = "Alt"; chars = "\\x1Bq"; }
				{ key = "Q"; mods = "Alt|Shift"; chars = "\\x1BQ"; }
				{ key = "R"; mods = "Alt"; chars = "\\x1Br"; }
				{ key = "R"; mods = "Alt|Shift"; chars = "\\x1BR"; }
				{ key = "S"; mods = "Alt"; chars = "\\x1Bs"; }
				{ key = "S"; mods = "Alt|Shift"; chars = "\\x1BS"; }
				{ key = "T"; mods = "Alt"; chars = "\\x1Bt"; }
				{ key = "T"; mods = "Alt|Shift"; chars = "\\x1BT"; }
				{ key = "U"; mods = "Alt"; chars = "\\x1Bu"; }
				{ key = "U"; mods = "Alt|Shift"; chars = "\\x1BU"; }
				{ key = "V"; mods = "Alt"; chars = "\\x1Bv"; }
				{ key = "V"; mods = "Alt|Shift"; chars = "\\x1BV"; }
				{ key = "W"; mods = "Alt"; chars = "\\x1Bw"; }
				{ key = "W"; mods = "Alt|Shift"; chars = "\\x1BW"; }
				{ key = "X"; mods = "Alt"; chars = "\\x1Bx"; }
				{ key = "X"; mods = "Alt|Shift"; chars = "\\x1BX"; }
				{ key = "Y"; mods = "Alt"; chars = "\\x1By"; }
				{ key = "Y"; mods = "Alt|Shift"; chars = "\\x1BY"; }
				{ key = "Z"; mods = "Alt"; chars = "\\x1Bz"; }
				{ key = "Z"; mods = "Alt|Shift"; chars = "\\x1BZ"; }
				{ key = "Key1"; mods = "Alt"; chars = "\\x1B1"; }
				{ key = "Key1"; mods = "Alt|Shift"; chars = "\\x1B!"; }
				{ key = "Key2"; mods = "Alt"; chars = "\\x1B2"; }
				{ key = "Key2"; mods = "Alt|Shift"; chars = "\\x1B#"; }
				{ key = "Key3"; mods = "Alt"; chars = "\\x1B3"; }
				{ key = "Key3"; mods = "Alt|Shift"; chars = "\\x1B#"; }
				{ key = "Key4"; mods = "Alt"; chars = "\\x1B4"; }
				{ key = "Key4"; mods = "Alt|Shift"; chars = "\\x1B$"; }
				{ key = "Key5"; mods = "Alt"; chars = "\\x1B5"; }
				{ key = "Key5"; mods = "Alt|Shift"; chars = "\\x1B%"; }
				{ key = "Key6"; mods = "Alt"; chars = "\\x1B6"; }
				{ key = "Key6"; mods = "Alt|Shift"; chars = "\\x1B^"; }
				{ key = "Key7"; mods = "Alt"; chars = "\\x1B7"; }
				{ key = "Key7"; mods = "Alt|Shift"; chars = "\\x1B&"; }
				{ key = "Key8"; mods = "Alt"; chars = "\\x1B8"; }
				{ key = "Key8"; mods = "Alt|Shift"; chars = "\\x1B*"; }
				{ key = "Key9"; mods = "Alt"; chars = "\\x1B9"; }
				{ key = "Key9"; mods = "Alt|Shift"; chars = "\\x1B("; }
				{ key = "Key0"; mods = "Alt"; chars = "\\x1B0"; }
				{ key = "Key0"; mods = "Alt|Shift"; chars = "\\x1B)"; }

			];
		};
	};

	programs.neovim.extraConfig = lib.optionalString config.programs.alacritty.enable "set termguicolors";
	# programs.neovim.extraConfig = lib.optionalString config.programs.alacritty.enable "set termguicolors";

}
