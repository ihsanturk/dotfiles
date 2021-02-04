# dotfiles
[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

## clone
```sh
git clone https://github.com/ihsanturk/dotfiles ~/dot
```

## install nix
through [nix-flakes-installer](https://github.com/numtide/nix-flakes-installer/releases)
```sh
https://github.com/numtide/nix-flakes-installer#readme
```
I commented out the big sur version detection block of the code in the
installer script. If you are in the feature and flakes are stable version of
the nix, just install nix from `curl -L https://nixos.org/nix/install | sh`

## install caches
using cachix
```sh
nix-env -iA cachix -f https://cachix.org/api/v1/install && cachix use nix-community
```
*can take half an hour depending on your network connection speed.*

### build
Build process is based on the hostname. So change your hostname repsectively.
Available hostnames are
* MacBook-Air

```sh
nix --experimental-features 'flakes nix-command' build
./result/sw/bin/darwin-rebuild switch --flake .
```

## now don't do these above anymore
do these instead
### loop
1. change your config however you want
2. build
```sh
darwin-rebuild switch --flake ~/dot
```
3. repeat
