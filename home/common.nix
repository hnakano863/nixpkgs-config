{ pkgs }:
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "hnakano";

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
   
    initExtra = ''
      if [ -z $IN_NIX_SHELL ]; then
        exec fish
      fi
    '';
  };

  programs.fish = {
    enable = true;

    functions = {
      vterm_printf = {
        body = builtins.readFile ./fish_functions/vterm_printf.fish;
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
    extraPackages = epkgs: with epkgs; [ vterm proofgeneral_HEAD ];
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    shortcut = "a";
    terminal = "screen-256color";
  };
}
