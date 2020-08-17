{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "hnakano";
  home.homeDirectory = "/home/hnakano";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";

  home.packages = with pkgs; [
    nixfmt bat exa fd ripgrep coq coqPackages.ssreflect
  ];

  programs.bash = {
    enable = true;
    profileExtra = ''
      export XDG_DATA_DIRS=$HOME/.nix-profile/share''${XDG_DATA_DIRS:+:}$XDG_DATA_DIRS
      export NIX_PATH=$HOME/.nix-defexpr/channels''${NIX_PATH:+:}$NIX_PATH
      export QT_QPA_PLATFORMTHEME="qt5ct"
      export QT_AUTO_SCREEN_SCALE_FACTOR=0
      export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
    '';

    initExtra = ''
      if [ -z $IN_NIX_SHELL ]; then
        exec fish
      fi
    '';
  };

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set -gx fish_user_paths $HOME/.emacs.d/bin $HOME/.yarn/bin $HOME/.cargo/bin
    '';

    functions = {
      vterm_printf = {
        body = builtins.readFile ./home/fish_functions/vterm_printf.fish;
      };
    };
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "hnakano863";
    userEmail = "notchi863@gmail.com";
    extraConfig = { pull.rebase = false; };
  };

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [ epkgs.vterm ];
  };
}
