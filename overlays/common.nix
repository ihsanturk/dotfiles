self: super:
{
  common-env = with self; super.buildEnv {
    name = "common-env";
    paths = [

      curl              # requests using urls.
      emv               # rename files with your favourite text editor.
      entr              # some kind of watcher and runner.
      exa               # fuck i need this, even if it requires bloat libs. :/
      fd                # `find` alternative written in rust.
      fira              # font
      fira-code         # font
      gawk              # manipulate text. `awk` alternative.
      gitAndTools.delta # git diff (long compile time).
      gitui             # git terminal ui
      gnupg             # encrypt/decrypt files or data.
      jq                # query json.
      nix-index         # quickly locate nix packages with specific files
      nix-info          # https://github.com/NixOS/nix/issues/3085
      nixfmt            # nix code formatter, use it.
      pinentry          # password taker... i guess?
      pup               # query html.
      python38Packages.titlecase # convert regular text to its title form.
      ranger            # file manager written in python.
      ripgrep           # `grep` alternative written in rust.
      rsync             # sync files without copying the same things.
      sd                # `sed` alternative written in rust.
      srm               # secure remove
      stdman            # std libary man pages
      tldr              # get quick examples about usage of the program.
      translate-shell   # google translate in cli written in awk.
      trash-cli         # trash files instead of bare rm.
      vscodium          # code editor.
      websocat          # websocket client

    ] ++ lib.optionals stdenv.isDarwin [

      # pinentry_mac    # password taker... i guess?
      coreutils       # extra coreutils
      ffmpeg          # manipulate/edit video or image
      graphviz        # visualize graphs
      ledger          # manage money and budgets
      m-cli           # swiss army knife for macos
      mpv             # play video, image or audio
      ncdu            # clear out your storage devices
      poppler_utils   # pdftotext # for ripgrep-all
      qrencode        # encode data to qr codes
      unixtools.watch # better `watch`
      youtube-dl      # download video from web

    ];
  };
}

