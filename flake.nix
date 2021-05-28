{
  description = "suckless user environment";

  inputs = rec {

    nixpkgs.url = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";

    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";

    # vi.url = "/Users/ihsan/Sync/code/github.com/ihsanturk/vi";
    # vi.inputs.nixpkgs.follows = "nixpkgs";
    # vi.inputs.flake-utils.follows = "flake-utils";

  };

  outputs = { self, nixpkgs, flake-utils, neovim-nightly }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let

        overlays = [

          neovim-nightly.overlay
          # vi.overlay

        ] ++ map # all overlays in the overlays directory
          (file: (import (./overlays + "/${file}")))
          (builtins.attrNames (builtins.readDir ./overlays));

        pkgs = import nixpkgs { inherit system overlays; };

      in {

        # should be a derivation. fuck, where is it?

        # couple hours later

        # still can't find this, i defined my derivation in overlays, right?

        # so, overlays don't go into pkgs because pkgs.user-env does not work or
        # something else...

        # i tried to import nixpkgs with overlays in repl, it turned out that
        # without inheriting overlays, it runs successfully so the problem here
        # is my map script for import overlay files, right? i think.

        # indeed. i wrote manually paths in overlay import and it worked so the
        # problem is with my map command

        # nope. it is the vi.overlay causing the problem. map command was
        # innocent but when i disable vi.overlay it works! going to vi flake to
        # find the problem

        # github:ihsanturk/vi can run with `nix run github:ihsanturk/vi` but
        # can't be imported as an overlay from a different flake like my
        # dotfiles.

        defaultPackage = pkgs.user-env;

      });
}

