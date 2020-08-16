{
  allowBroken = false;
  allowUnfree = true;
  allowUnsupportedSystem = false;
  allowInsecure = false;

  packageOverrides = pkgs:
    with pkgs; rec {
      emacs = pkgs.emacs.override {
        withXwidgets = true;
        withGTK3 = true;
        inherit gtk3-x11 webkitgtk;
      };
    };
}
