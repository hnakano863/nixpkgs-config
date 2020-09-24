
{ pkgs }:
{
  home.homeDirectory = "/home/hnakano";

  home.packages = with pkgs; [
    sqlite 
  ];

  programs.bash.profileExtra = ''
    export XDG_DATA_DIRS=$HOME/.nix-profile/share''${XDG_DATA_DIRS:+:}$XDG_DATA_DIRS
    export LIBGL_ALWAYS_INDIRECT=1
    export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
    if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
        . $HOME/.nix-profile/etc/profile.d/nix.sh;
    fi
  '';

  programs.fish.interactiveShellInit = ''
    set -gx fish_user_paths $HOME/go/bin $HOME/.emacs.d/bin $HOME/.yarn/bin $HOME/.cargo/bin $HOME/.local/bin
  '';

}
