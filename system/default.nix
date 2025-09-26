{ config, lib, pkgs, modulesPath, inputs, unstable, ... }:
{
  imports = [
    ./desktop.nix
    ./system.nix
    ./hardware.nix
    ../user/user.nix
  ];
}