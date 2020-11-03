{ config, lib, pkgs, ... }:
let

	tpm = builtins.fetchGit {
		url = "https://github.com/tmux-plugins/tpm";
		rev = "60a36d6f7adddfb68d68349dce3081e7d5c4d4ab";
	};

in {

	programs.tmux = {
		baseIndex = 1;
		keyMode = "vi";
		escapeTime = 0;
		terminal = "xterm-256color";

		# plugins = with pkgs; [
		# 	{
		# 		plugin = tmuxPlugins.resurrect;
		# 		extraConfig = "set -g @resurrect-startegy-nvim 'session'";
		# 	}
		# 	{
		# 		plugin = tmuxPlugins.continuum;
		# 		extraConfig = ''
		# 			set -g @continuum-restore 'on'
		# 			set -g @continuum-save-interval '2' # minutes
		# 		'';
		# 	}
		# ];

		extraConfig = ''
			# set-option -sa terminal-overrides ',screen:RGB'
			# set -g terminal-overrides ',screen:RGB'
			# set -as terminal-overrides ',screen*:sitm=\E[3m'
			set-option -ga terminal-overrides ",xterm-256color:Tc"
			bind p paste-buffer
			bind Escape copy-mode
			set-option -g mouse on
			set-option -g renumber-windows on
			bind-key -Tcopy-mode-vi 'Escape' send -X cancel
			bind-key -T copy-mode-vi 'v' send -X begin-selection
			bind-key -T copy-mode-vi 'Bspace' send -X halfpage-up
			bind-key -T copy-mode-vi 'Space' send -X halfpage-down
			bind-key -T copy-mode-vi 'C-v' send -X rectangle-toggle
			#bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel
			bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel 'xclip -in -selection clipboard'
			set -g @plugin 'tmux-plugins/tpm'
			set -g @plugin 'tmux-plugings/tmux-sensible'
			# set -g @plugin 'jimeh/tmux-themepack' # theme: minimal
			set -g @plugin 'wfxr/tmux-power' # theme: bloat but good design
			run '~/.tmux/plugins/tpm/tpm' # should be the last line
		'';

	};

	home.file.".tmux/plugins/tpm".source = "${tpm}/";

}
