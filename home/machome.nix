{ pkgs }:
{
  home.homeDirectory = "/Users/hiroshi";
  programs.bash.profileExtra = ''
    if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
        . $HOME/.nix-profile/etc/profile.d/nix.sh;
    fi
  '';

  programs.fish.interactiveShellInit = ''
    set -gx fish_user_paths $HOME/.emacs.d/bin $HOME/.yarn/bin $HOME/.cargo/bin $HOME/.local/bin
  '';

  programs.emacs.package = pkgs.emacsMacport;
}
