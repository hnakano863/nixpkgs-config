{ config, pkgs, lib, ... }:
let
  common = import ./home/common.nix { inherit pkgs; };
  machome = import ./home/machome.nix { inherit pkgs; };
  linuxhome = import ./home/linuxhome.nix { inherit pkgs; };
  wslhome = import ./home/wslhome.nix { inherit pkgs; };
in
lib.mkMerge [
  common
  (lib.mkIf pkgs.stdenv.isDarwin machome)
]
