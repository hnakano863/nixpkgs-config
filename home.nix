{ config, pkgs, lib, ... }:
let
  machine = import ./home/machine.nix { inherit pkgs; };
  common = import ./home/common.nix { inherit pkgs; };
  machome = import ./home/machome.nix { inherit pkgs; };
  linuxhome = import ./home/linuxhome.nix { inherit pkgs; };
  wslhome = import ./home/wslhome.nix { inherit pkgs; };
in
lib.mkMerge [
  common
  (lib.mkIf machine.isDarwin machome)
  (lib.mkIf machine.isManjaro linuxhome)
  (lib.mkIf machine.isUbuntu wslhome)
]
