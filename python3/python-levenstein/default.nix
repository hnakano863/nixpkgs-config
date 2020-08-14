{ lib, pkgs }:
pkgs.buildPythonPackage rec {
  pname = "python-Levenstein";
  version = "0.12.0";

  src = pkgs.fetchPypi {
    inherit pname version;
    sha256 = "033a11de5e3d19ea25c9302d11224e1a1898fe5abd23c61c7c360c25195e3eb1";
  };

  doCheck = false;
  meta = with lib; {
    homepage = "http://github.com/ztane/python-Levenshtein";
    license = licenses.mit;
  };
}
