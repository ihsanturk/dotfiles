#!/bin/sh

plan() { #{{{1
	plans="${HOME}/Dropbox/life/plans"
	while read -r line; do
		id=$(($(tail -1 "$plans" | cut -f1) + 1))
		echo "$id	$(date +%s)	$line" >> "$plans"
		tail -n1 "$plans"
	done
}

#}}}
safari_history() { #{{{1
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  cp -f ~/Library/Safari/History.db /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(id, 1, $cols), url
     from history_items order by visit_count_score desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}'  |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

# }}}
tmp() { # {{{1
	$EDITOR "$(mkptemp).$1"
}

# }}}
openblogpost() { #1:title {{{1
	cd "${HOME}/Dropbox/document/blog/ihsanturk.dev/" || {
		echo >&2 "$(basename "$0"): No such directory."; return 1;
	}
	nvr --remote-wait \
		"${HOME}/Dropbox/document/blog/ihsanturk.dev/content/posts/$1.md"
}

# }}}
newblogpost() { #1:title {{{1
	cd "${HOME}/Dropbox/document/blog/ihsanturk.dev/" || {
		echo >&2 "$(basename "$0"): No such directory."; return 1;
	}
	hugo new "posts/$1.md" && {
		nvr --remote-wait \
			"${HOME}/Dropbox/document/blog/ihsanturk.dev/content/posts/$1.md"
	}
}

# }}}
tmp() { #1:extension {{{1
	nvr --remote-wait "$(mktemp).$1";
}

# }}}
notefromyoutube() { #1:title-one-hunk #2:youtube_link {{{1
	videoid=$(echo "$2" | grep -o 'v=[^\&]*' | cut -c3-)
	cd "${HOME}/Dropbox/document/blog/ihsanturk.dev/" || {
		echo >&2 "$(basename "$0"): No such directory."; return 1;
	}
	hugo new "posts/$1.md" && {
		printf "Notes from [this YouTube video](%s).\n\n[![video](http://img.youtube.com/vi/%s/0.jpg)](%s)" "$2" "$videoid" "$2">> "${HOME}/Dropbox/document/blog/ihsanturk.dev/content/posts/$1.md"
		nvr --remote-wait "${HOME}/Dropbox/document/blog/ihsanturk.dev/content/posts/$1.md"
	}
}

# }}}
extract() { # {{{1
	if [ -f "$1" ] ; then
		case "$1" in
			*.tar.bz2) tar xvjf "$1"  ;;
			*.tar.gz)  tar xvzf "$1"  ;;
			*.tar.xz)  tar xvJf "$1"  ;;
			*.bz2)     bunzip2 "$1"   ;;
			*.rar)     unrar x "$1"   ;;
			*.gz)      gunzip "$1"    ;;
			*.tar)     tar xvf "$1"   ;;
			*.tbz2)    tar xvjf "$1"  ;;
			*.tgz)     tar xvzf "$1"  ;;
			*.zip)     unzip "$1"     ;;
			*.Z)       uncompress "$1";;
			*.7z)      7z x "$1"      ;;
			*.xz)      unxz "$1"      ;;
			*.exe)     cabextract "$1";;
			*)         echo "\`$1': unrecognized file compression" ;;
		esac
	else
		echo "\`$1' is not a valid file"
	fi
}

# }}}

# FORSAKEN {{{1

# rg() { # use ripgrep with fzf {{{2
# 	RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case"
# 	INITIAL_QUERY="$1"
# 	FZF_DEFAULT_COMMAND="$RG_PREFIX $INITIAL_QUERY" \
# 		fzf --bind "change:reload:$RG_PREFIX {q} || true" \
# 			--ansi --phony --query "$INITIAL_QUERY"
# }

# # }}}

# backward-kill-dir () {
#     local WORDCHARS=${WORDCHARS/\/}
#     zle backward-kill-word
# }

# zle -N backward-kill-dir
# bindkey '^[^?' backward-kill-dir

# }}}
