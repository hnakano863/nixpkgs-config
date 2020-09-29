self: super: {
  cica = super.callPackage ./cica/default.nix {};
  iconsfordevs = super.callPackage ./iconsfordevs/default.nix {};
}
