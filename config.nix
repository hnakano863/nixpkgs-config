{
  allowBroken = false;
  allowUnfree = true;
  allowUnsupportedSystem = false;
  allowInsecure = false;
  packageOverrides = pkgs:
    with pkgs; rec {
      python3 = import ./python3/default.nix { inherit pkgs; };
    };
}
