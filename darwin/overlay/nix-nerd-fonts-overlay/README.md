# [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) overlay for [Nix](https://github.com/nixos/)

This overlay was made to be able to download nerd fonts individually instead of taking them all at once.
It should help people with an issue similar to [NixOS/nixpkgs#75606](https://github.com/NixOS/nixpkgs/issues/75606).

## DEPRECATED

A solution now exists on nixpkgs. You can now use nerdfonts and specify which fonts you want by
overriding the [fonts](https://github.com/NixOS/nixpkgs/blob/4a737a18ac3076fc0bfd40c88556f966f9042162/pkgs/data/fonts/nerdfonts/default.nix#L7)
attribute.

```nix
nerdfonts.override {
  fonts = [ font-name another-font-name ];
}
```

Where font-names are available in [shas.nix](https://github.com/NixOS/nixpkgs/blob/6ba3207643fd27ffa25a172911e3d6825814d155/pkgs/data/fonts/nerdfonts/shas.nix#L2-L51).
