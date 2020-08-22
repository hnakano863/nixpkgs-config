
{ pkgs }:
{
  home.homeDirectory = "/home/hnakano";

  programs.bash.profileExtra = ''
    export XDG_DATA_DIRS=$HOME/.nix-profile/share''${XDG_DATA_DIRS:+:}$XDG_DATA_DIRS
    export NIX_PATH=$HOME/.nix-defexpr/channels''${NIX_PATH:+:}$NIX_PATH
    export QT_QPA_PLATFORMTHEME="qt5ct"
    export QT_AUTO_SCREEN_SCALE_FACTOR=0
    export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
  '';

  programs.fish.interactiveShellInit = ''
    set -gx fish_user_paths $HOME/.emacs.d/bin $HOME/.yarn/bin $HOME/.cargo/bin
  '';

}
