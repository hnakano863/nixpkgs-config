{ pkgs }:
pkgs.python3.override {
  packageOverrides = self: super: rec {
    autograd-gamma = super.callPackage ./autograd-gamma/default.nix { pkgs = super; };

    lifelines = super.callPackage ./lifelines/default.nix { pkgs = super; };
  };
  self = pkgs.python3;
}
