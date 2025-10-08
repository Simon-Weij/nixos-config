{ config, lib, pkgs, modulesPath, inputs, unstable, flakeConfig, ... }:
{
  imports = [
    ./desktop.nix
    (import ./system.nix { inherit pkgs flakeConfig; })
    ./hardware.nix
    ./packages/steam.nix
    ../user/user.nix
  ];
}