{ lib, pkgs, numpy, scipy, pandas, matplotlib, autograd, autograd-gamma, patsy
}:
pkgs.buildPythonPackage rec {
  pname = "lifelines";
  version = "0.25.2";

  src = pkgs.fetchPypi {
    inherit pname version;
    sha256 = "bf5627e970b1549eb3ced469a628875ce9622798ef7cd9066e9cc23578e33782";
  };

  doCheck = false;

  propagatedBuildInputs =
    [ numpy scipy pandas matplotlib autograd autograd-gamma patsy ];

  meta = with lib; {
    homepage = "https://github.com/CamDavidsonPilon/lifelines";
    description = "Survival analysis in Python";
    license = licenses.mit;
  };
}
