# dotfiles
[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

## initial setup
using [nix-flakes-installer](https://github.com/numtide/nix-flakes-installer/releases)
```sh
https://github.com/numtide/nix-flakes-installer#readme
```
I commented out the big sur version detection block of the code in the
installer script. If you are in the feature and flakes are stable version of
the nix, just install nix from `curl -L https://nixos.org/nix/install | sh`

```sh
mkdir -p ~/.config/nix
echo 'experimental-features = nix-command flakes ca-references' > ~/.config/nix/nix.conf
```
## install
```
nix profile install github:ihsanturk/dotfiles
```

## update
```
nix flake update &&
  nix profile upgrade $(nix profile list |
     grep -w ihsanturk/dotfiles | cut -d' ' -f1)
```

---

## show stranger file formats as text in macos quick look
(QLStephen)
find the type of the file format with
```
mdls -name kMDItemContentType <filepath>
```

add the output above and these to `LSItemContentTypes` array in
`~/Library/QuickLook/QLStephen.qlgenerator/Contents/Info.plist`
```
<string>public.unix-executable</string>
<string>dyn.ah62d4rv4ge8064p2</string>
```
and run
```
xattr -cr ~/Library/QuickLook/QLStephen.qlgenerator
qlmanage -r && qlmanage -r cache && pkill Finder && open /tmp
```
