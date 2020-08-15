self: super: {
  python3 = super.python3.override {
    packageOverrides = self: super: rec {
      autograd-gamma =
        super.callPackage ./autograd-gamma/default.nix { pkgs = super; };

      lifelines = super.callPackage ./lifelines/default.nix { pkgs = super; };

      python-levenstein =
        super.callPackage ./python-levenstein/default.nix { pkgs = super; };

      sqlalchemy-access =
        super.callPackage ./sqlalchemy-access/default.nix { pkgs = super; };
    };
    self = super.python3;
  };
}
