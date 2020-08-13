{ lib, pkgs, autograd, scipy }:
pkgs.buildPythonPackage rec {
  pname = "autograd-gamma";
  version = "0.4.1";

  src = pkgs.fetchPypi {
    inherit pname version;
    sha256 = "3b4349cb415bd6e28dd2fac5055e34de1b6c87fe711757a0e42a84bd650fba35";
  };

  doCheck = false;
  propagatedBuildInputs = [ autograd scipy ];
  meta = with lib; { license = licenses.mit; };
}
