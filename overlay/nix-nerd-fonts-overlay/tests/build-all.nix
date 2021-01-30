{ pkgs ? import <nixpkgs> { } }:

with pkgs.lib;

let
  extended-pkgs = pkgs.extend (import ../default.nix);
in
  attrValues extended-pkgs.nerd-fonts
