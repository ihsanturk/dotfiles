Ready to [stow](https://www.gnu.org/software/stow/) it.
You can use stow just for one program. Example
```sh
cd dotfiles
stow emacs #Just install the emacs configuration
```
If there is not a file in the destination directory then
your new emacs configuration is ready.

|     Sort | Value                                                   |
|---------:|:--------------------------------------------------------|
|       OS | ***[macos](https://apple.com/macos/mojave)***           |
| Terminal | ***[iterm2](https://iterm2.com)***                      |
|    Shell | ***[zsh](https://zsh.org/)***                           |
|   Editor | ***[emacs](http://www.gnu.org/software/emacs)***        |
|  Browser | ***[firefox](https://www.mozilla.org/en-GB/firefox/)*** |

#### Notes
In order to install *dmenu_run* cache list
you should **`keep`** just the **`else section`** of the
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
