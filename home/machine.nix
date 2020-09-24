{ pkgs }:
let
  matchOS = s: builtins.match ''NAME="([A-z]*).*'' s;
  osRelease = builtins.readFile /etc/os-release;
  osName = builtins.elemAt (matchOS osRelease) 0;
in {
  isUbuntu = osName == "Ubuntu";
  isManjaro = osName == "Manjaro";
  isDarwin = pkgs.stdenv.isDarwin;
}
