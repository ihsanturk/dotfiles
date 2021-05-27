{
  description = "suckless user environment";

  inputs = rec {
    nixpkgs.url = "github:nixos/nixpkgs";

    # vi.url = "/Users/ihsan/Sync/code/github.com/ihsanturk/vi";
    # vi.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = { self, nixpkgs }:
  let
    systems = [

      "x86_64-darwin"
      "x86_64-linux"

    ];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
    overlays = [

      # vi.overlay

    ] ++
      map # all overlays in the overlays directory
      (name: import (./overlays + "/${name}"))
      (builtins.attrNames (builtins.readDir ./overlays));

    pkg-import = pkgs: forAllSystems (system:
      import pkgs {
        inherit system overlays;
        # config = { allowUnfree = true; };
      }
    );

    nixpkgs-for = pkg-import nixpkgs;
  in {

    packages = forAllSystems (system: nixpkgs-for."${system}");
    defaultPackage = forAllSystems (system: nixpkgs-for."${system}".user-env);

  };
}

