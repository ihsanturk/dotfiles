# Dotfiles

Ready to [stow](https://www.gnu.org/software/stow/) it.
You can use [stow](https://www.gnu.org/software/stow/) just for one program.

## Example:
```sh
cd dotfiles
stow emacs # Install the emacs configuration
```
If there is not a file in the destination directory then your new emacs
configuration is ready.


## ➜ ~ fetch

- OS: [MacOS](https://support.apple.com/macos/mojave)
- WM: <a href=https://en.wikipedia.org/wiki/Quartz_(graphics_layer)>Quartz</a>
- Shell: [Zsh](https://zsh.org/)
- Terminal: [Kitty](https://sw.kovidgoyal.net/kitty/)
- Editor 1: [Neovim](https://neovim.io/)
- Editor 2: [GNU Emacs](https://www.gnu.org/software/emacs/) for [org-mode](https://en.wikipedia.org/wiki/Org-mode) not very often
- Browser: [Safari](https://www.apple.com/safari/) with [sVim](https://github.com/flippidippi/sVim) extension

## Notes

(Optional/dmenu.sh script takes care of the issue below automatically)

**(Deprecated)**

In order to install *dmenu_run* cache list you should *keep*
+just the *else section* of the */usr/bin/dmenu_path* file. So the+
+/usr/bin/dmenu_path should look like:+

```sh
#!/bin/sh

cachedir="${XDG_CACHE_HOME:-"$HOME/.cache"}"
cache="$cachedir/dmenu_run"

[ ! -e "$cachedir" ] && mkdir -p "$cachedir"

IFS=:
cat "$cache"
```
