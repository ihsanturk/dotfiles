{ fetchzip }:

{ name, zipname, version, sha256 }:

fetchzip {
  name = "nerd-fonts-${name}-${version}";

  url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/${zipname}";

  postFetch = ''
    mkdir -p $out/share/fonts

    unzip -j $downloadedFile \*.otf -d $out/share/fonts/opentype || true
    unzip -j $downloadedFile \*.ttf -d $out/share/fonts/truetype || true
  '';

  inherit sha256;
}
