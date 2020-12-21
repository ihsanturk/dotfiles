{ pkgs, ... }:
{

	ledger-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
		name = "ledger-vim";
		src = pkgs.fetchgit {
			url = "https://github.com/ziman/ledger-vim";
			sha256 = "sha256-YbSkK/N8ahNXU6xleHOHzLvn9+YLJVWLyy8FBe/ydow=";
		};
	};


	ihlog-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
		name = "ihlog-vim";
		src = ~/code/github.com/ihsanturk/ihlog; # pkgs.fetchgit {
			# url = "https://github.com/ihsanturk/ihlog-vim";
			# sha256 = "sha256-K5d/Gr2FWZS6N+ftSGY2B71UjfWSHmTvcsn5pEoj5wQ=";
		# };
	};

	vim-you-autocorrect = pkgs.vimUtils.buildVimPluginFrom2Nix {
		name = "vim-you-autocorrect";
		src = pkgs.fetchgit {
			url = "https://github.com/sedm0784/vim-you-autocorrect";
			sha256 = "sha256-K5d/Gr2FWZS6N+ftSGY2B71UjfWSHmTvcsn5pEoj5wQ=";
		};
	};

	php-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
		name = "php.vim";
		src = pkgs.fetchgit {
			url = "https://github.com/StanAngeloff/php.vim";
			sha256 = "sha256-sxrenhhNvpfJNCOKlaLvSvLjUSKtseZpWbeULmOu2yY=";
		};
	};

	vim-searchlight = pkgs.vimUtils.buildVimPluginFrom2Nix {
		name = "vim-searchlight";
		src = pkgs.fetchgit {
			url = "https://github.com/PeterRincker/vim-searchlight";
			sha256 = "sha256-yE01q29tI+nI2ebBAMQQIo74hsDkXzfhHkopS+BiIlk=";
		};
	};

	info-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
		name = "info-vim";
		src = pkgs.fetchgit {
			url = "https://gitlab.com/HiPhish/info.vim";
			sha256 = "0ggszp5mpmz3x216c8h37s08l9x5jkp03rihsk5hiw52qvj3d1jx";
		};
	};

	v-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
		name = "v-vim";
		src = pkgs.fetchgit {
			url = "https://github.com/ollykel/v-vim";
			sha256 = "1g3lvn4pyqsi2f47rqfvlvmnxglldm95q4gi3xbly8rivvn909a9";
		};
	};

	salvation-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
		name = "salvation-vim";
		src = pkgs.fetchgit {
			url = "https://gitlab.com/branwright/salvation-vim";
			sha256 = "1hhqvn0jq6ksc14jq0v1y0m2bxx20cplw6jmlxhv0pg9m4d9lsz2";
		};
	};

	vim-templates = pkgs.vimUtils.buildVimPluginFrom2Nix {
		name = "vim-templates";
		src = pkgs.fetchFromGitHub {
			owner = "tibabit";
			repo = "vim-templates";
			rev = "c3e51bb9f1dfd5d1d6c6b93306c1f25863001db3";
			sha256 = "17438vy2hm8lm6iz4a5gzndvwxywn8b2fhil6qr0gy8dj7b0vdn3";
		};
	};

	vim-tureng = pkgs.vimUtils.buildVimPluginFrom2Nix {
		name = "vim-tureng";
		src = pkgs.fetchFromGitHub {
			owner = "ihsanturk";
			repo = "vim-tureng";
			rev = "master";
			sha256 = "0c1gdba1lxyxkwaapqi542cb6w9wmapdzn5z378klhz1jk5j9m4s";
		};
	};

	# fiatjaf/neuron.vim (for of my plugin)
	neuron-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
		name = "neuron.vim";
		src = pkgs.fetchgit {
			url = "https://github.com/fiatjaf/neuron.vim";
			sha256 = "sha256-XgT2EhKSV9zlGhSWy7w9+qJzjxw1kNNfwphLQxTwAHQ=";

		# src = ~/code/github.com/ihsanturk/neuron.vim;
		# # src = pkgs.fetchFromGitHub {
		# # 	owner = "ihsanturk";
		# # 	repo = "neuron.vim";
		# # 	rev = "master";
		# # 	sha256 = "0myadiy6y2p73lhdzk2w55whg4i5rs004jaw1m21cz0dk8k8ibn2";
		# # };
		};

	};

	code-stats-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
		name = "code-stats-vim";
		src = pkgs.fetchgit {
			url = "https://gitlab.com/code-stats/code-stats-vim";
			sha256 = "12qnxwp0fx6m2wgfsar3rwdzwsbzsc0l70rz31ximl17h1k41g81";
		};
	};

	tabline-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
		name = "tabline-vim";
		src = pkgs.fetchFromGitHub {
			owner = "mkitt";
			repo = "tabline.vim";
			rev = "master";
			sha256 = "1dk796zacs0x9kfr15db9j7034w6fqhng9pr49g1ga4a3hzzqmp7";
		};
	};

	vim-wheel = pkgs.vimUtils.buildVimPluginFrom2Nix {
		name = "vim-wheel";
		src = pkgs.fetchFromGitHub {
			owner = "reedes";
			repo = "vim-wheel";
			rev = "master";
			sha256 = "sha256-DXOF0xWu2gN21O2Z/twC5qmFJUctT1iAYMUg93dscGQ=";
		};
	};

	twitvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
		name = "twitvim";
		src = pkgs.fetchFromGitHub {
			owner = "twitvim";
			repo = "twitvim";
			rev = "master";
			sha256 = "0wfwqs279rj8jg8559pwb2qj8p18vibs2d0d2pcr79znd8vr1c25";
		};
	};

	vim-grave-navigation = pkgs.vimUtils.buildVimPluginFrom2Nix {
		name = "vim-grave-navigation";
		src = pkgs.fetchFromGitHub {
			owner = "ihsanturk";
			repo = "vim-grave-navigation";
			rev = "master";
			sha256 = "sha256-cAehKy2zF7tL0J1dHz5K9MGnS4v5T5MRqgeGSbiBzKo=";
		};
	};

	vim-emacs-like = pkgs.vimUtils.buildVimPluginFrom2Nix {
		name = "vim-emacs-like";
		src = pkgs.fetchFromGitHub {
			owner = "ihsanturk";
			repo = "vim-emacs-like";
			rev = "master";
			sha256 = "0m0b0g8wkbk4hwa5zw369i3pz8izv8ml94np1ich1q6a6vz4x0ym";
		};
	};

	vim-ihsensible = pkgs.vimUtils.buildVimPluginFrom2Nix {
		name = "vim-ihsensible";
		src = pkgs.fetchFromGitHub {
			owner = "ihsanturk";
			repo = "vim-ihsensible";
			rev = "master";
			sha256 = "sha256-BWPhEfyeW4nWMX1fGt8JXuF2a64WFnUJuEGaBp3JeT0=";
		};
	};

}
