{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  pname = "quickjs";
  version = "2020-11-08";

  src = fetchurl {
    url = "https://bellard.org/${pname}/${pname}-${version}.tar.xz";
    sha256 = "sha256-Lp1j2rOQqV7TZSOPIdjpBpGH9+0ZV4ICfwqzEbtkGHs=";
  };

  makeFlags = [ "prefix=${placeholder ''out''}" ];
  enableParallelBuilding = true;

  doInstallCheck = true;
  installCheckPhase = ''
    PATH="$out/bin:$PATH"

    # Programs exit with code 1 when testing help, so grep for a string
    set +o pipefail
    qjs     --help 2>&1 | grep "QuickJS version"
    qjsbn   --help 2>&1 | grep "QuickJS version"
    qjscalc --help 2>&1 | grep "QuickJS version"
    set -o pipefail

    temp=$(mktemp).js
    echo "console.log('Output from compiled program');" > "$temp"
    set -o verbose
    out=$(mktemp) && qjsc         "$temp" -o "$out" && "$out" | grep -q "Output from compiled program"
    out=$(mktemp) && qjsbnc       "$temp" -o "$out" && "$out" | grep -q "Output from compiled program"
    out=$(mktemp) && qjsc   -flto "$temp" -o "$out" && "$out" | grep -q "Output from compiled program"
    out=$(mktemp) && qjsbnc -flto "$temp" -o "$out" && "$out" | grep -q "Output from compiled program"
  '';

  meta = with stdenv.lib; {
    description = "A small and embeddable Javascript engine";
    homepage = "https://bellard.org/quickjs/";
    maintainers = with maintainers; [ stesie ];
    platforms = platforms.linux ++ platforms.darwin;
    license = licenses.mit;
  };
}
