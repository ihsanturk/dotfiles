# dotfiles
[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

## clone
```sh
git clone https://github.com/ihsanturk/dotfiles ~/dot
```

## activate experimental features
for flakes and nix-command
`/etc/nix/nix.conf`
```
experimental-features = nix-command flakes
```

## install
### nix
through [nix-flakes-installer](https://github.com/numtide/nix-flakes-installer/releases)
```sh
https://github.com/numtide/nix-flakes-installer#readme
```
I commented out the big sur version detection block of the code in the
installer script. If you are in the feature and flakes are stable version of
the nix, just install nix from `curl -L https://nixos.org/nix/install | sh`

### caches
with cachix
```sh
nix-env -iA cachix -f https://cachix.org/api/v1/install && cachix use nix-community
```
*can take half an hour depending on your network connection speed.*

### run
```sh
nix build '.#darwinConfiguration.MacBookAir.system'
```
- delete etc/nix/nix.conf because nix-darwin will overwrite that file.
./result/sw/bin/darwin-rebuild switch --flake .
```

---

## now don't do these above anymore
### loop
1. update config
2. build
```sh
cd ~/dot;
nix build '.#darwinConfigurations.MacBookAir.system' &&
	./result/sw/bin/darwin-rebuild switch --flake .
```
3. repeat
