{ lib, pkgs, sqlalchemy, pyodbc }:
pkgs.buildPythonPackage rec {
  pname = "sqlalchemy-access";
  version = "1.0.6";

  src = pkgs.fetchPypi {
    inherit pname version;
    sha256 = "8433cb05c7e7501dcc0c4fe87c5df096722da25e9e29a905bb33fb03b4e561d9";
  };

  doCheck = false;

  propagatedBuildInputs = [ sqlalchemy pyodbc ];

  meta = with lib; {
    homepage = "https://github.com/gordthompson/sqlalchemy-access";
    license = licenses.mit;
  };
}
