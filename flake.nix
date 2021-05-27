{
  description = "suckless user environment";

  inputs = rec {

    nixpkgs.url = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";

    vi.url = "/Users/ihsan/Sync/code/github.com/ihsanturk/vi";
    vi.inputs.nixpkgs.follows = "nixpkgs";
    vi.inputs.flake-utils.follows = "flake-utils";

  };

  outputs = { self, nixpkgs, flake-utils, vi }@inputs:
  flake-utils.lib.eachDefaultSystem (system:
  let
    overlays = [

      vi.overlay

    ] ++
      map # all overlays in the overlays directory
      (name: import (./overlays + "/${name}"))
      (builtins.attrNames (builtins.readDir ./overlays));

    pkgs = import nixpkgs { inherit system overlays; };
  in {

    defaultPackage.${system} = pkgs.ihsan-env;

  });
}

