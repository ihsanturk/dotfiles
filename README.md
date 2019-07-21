Ready to [stow](https://www.gnu.org/software/stow/) it.
You can use stow just for one program. Example
```sh
cd dotfiles
stow nvim #Just install the nvim configuration
```
If there is not a file in the destination directory then
your new nvim configuration is ready.

|||
|---------:|:------------------------------------------|
| OS       | ***[arch linux](https://archlinux.org)*** |
| Terminal | ***[st](https://st.suckless.org)***       |
| Shell    | ***[zsh](https://zsh.org/)***             |
| Editor   | ***[vim](http://www.vim.org)***           |
| Browser  | ***[surf](https://surf.suckless.org)***   |

#### Notes
In order to install (link) *dmenu_run* cache list
you should **`keep`** just the **`else section code`** of the
**`/usr/bin/dmenu_path`** file

So the /usr/bin/dmenu_path should look like:
```sh
#!/bin/sh

cachedir="${XDG_CACHE_HOME:-"$HOME/.cache"}"
cache="$cachedir/dmenu_run"

[ ! -e "$cachedir" ] && mkdir -p "$cachedir"

IFS=:
cat "$cache"
```
