{ pkgs }:
with pkgs;
python3.override {
  packageOverrides = self: super: rec {
    autograd-gamma =
      super.callPackage ./autograd-gamma/default.nix { pkgs = super; };

    lifelines = super.callPackage ./lifelines/default.nix { pkgs = super; };

    python-levenstein =
      super.callPackage ./python-levenstein/default.nix { pkgs = super; };

    sqlalchemy-access =
      super.callPackage ./sqlalchemy-access/default.nix { pkgs = super; };

    python_tlv_analysis = super.callPackage ./python_tlv_analysis/default.nix {
      pkgs = super;
      fetchGit = builtins.fetchGit;
    };
  };
  self = pkgs.python3;
}
