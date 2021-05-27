self: super:
{
  my-pkgs = with self; super.buildEnv {
    name = "my-pkgs";
    paths = [

      common-env

    ] ++ lib.optionals stdenv.isLinux [

      # linuxEnv

    ];
  };

  userEnv = with self; super.buildEnv {
    name = "ihsan-env";
    paths = [

      my-pkgs

    ] ++ lib.optionals stdenv.isLinux [

      # mailSyncService

    ];
  };
}

