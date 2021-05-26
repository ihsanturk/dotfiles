{
  description = "ihsanturk's personal machine configurations.";

  inputs.nixpkgs.url = "github:nixos/nixpkgs";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  inputs.darwin.url = "github:ihsanturk/nix-darwin";
  inputs.darwin.inputs.nixpkgs.follows = "nixpkgs";

  inputs.home-manager.url = "github:nix-community/home-manager";
  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";

  inputs.neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  inputs.solar.url = "github:ihsanturk/solar";
  inputs.vi.url = "github:ihsanturk/vi";


  outputs =  { self,
    darwin,
    solar,  # TODO: make this to a custom nixpkgs repo like (ihsanpkgs)?
    vi,
    nixpkgs,
    home-manager,
    flake-utils,
    neovim-nightly-overlay,
    ...
  }@inputs:
  flake-utils.lib.eachDefaultSystem (system:
  let

    overlays = [
      inputs.neovim-nightly-overlay.overlay
    ];
    # pkgs = nixpkgs.legacyPackages.${system};

    pkgs = import nixpkgs { inherit system; };

    impurePaths = [

      "$HOME/.cargo/bin"
      "$HOME/Library/Python/3.8/bin"
      "$HOME/Sync/bin"
      "/usr/local/mysql/bin"

    ];
    completionIgnore = [

      ".egg-info"
      ".lock"
      ".o"
      ".pyc"

    ];
  in {

    nixpkgs.overlays = overlays;

    homeConfigurations = {

      ihsan = home-manager.lib.homeManagerConfiguration {
        homeDirectory = /. + builtins.getEnv "HOME";
        inherit system;
        stateVersion = "21.05";
        username = "ihsan";
        configuration = { pkgs, ... }: {
          nixpkgs.overlays = overlays;
          programs.home-manager.enable = true;
          home.packages = import ./base.nix pkgs;
          home.sessionVariables = rec {
            DIR_CODE  = "$HOME/Sync/code";
            DIR_LEARN = "$HOME/Sync/code/github.com/ihsanturk/learn";
            EDITOR    = "nvim";
            FIGNORE   = (builtins.concatStringsSep ":" completionIgnore);
            GPG_TTY   = "$(tty)";
            LANG      = "en_GB.UTF-8";
            PATH      = (builtins.concatStringsSep ":" impurePaths) + ":$PATH";
            VISUAL    = EDITOR;
          };
          imports = [
            ./module/autojump.nix
            ./module/bash.nix
            ./module/bat.nix
            ./module/fzf.nix
            ./module/git.nix
            ./module/h.nix
            ./module/ledger.nix
            ./module/neovim.nix
            ./module/tmux.nix
            ./module/zsh.nix
            ./module/neomutt.nix
            ./module/pass.nix
            ./dev-env/nix.nix
          ];
        };
      };

    };

    darwinConfigurations = {

      MacBook-Air = darwin.lib.darwinSystem {
        modules = [ (import ./profile/mba.nix) ];
      };

    };

    packages.x86_64-darwin = {

      core = pkgs.callPackage
        ({ buildEnv, bat, exa }:
        buildEnv {
          name = "ihsan-coreutils";
          paths = [ bat exa ];
          pathsToLink = [ "/bin" ];
        }) { };

      cat = pkgs.bat;
      solar = inputs.solar.defaultPackage;
      vi = inputs.vi.defaultPackage;

    };

    darwinPackages = self.darwinConfigurations."simple".pkgs;
    defaultPackage.x86_64-darwin = self.darwinConfigurations.MacBook-Air.system;

    apps.${system}.home-manager = {
      type = "app";
      program = "${home-manager.defaultPackage.x86_64-darwin}/bin/home-manager";
    };

  });

}
