{
  config,
  lib,
  pkgs,
  modulesPath,
  inputs,
  unstable,
  flakeConfig,
  ...
}:
let
  sapphireConfig = import ./sapphire.nix;
in
{
  imports = [
    ./hardware.nix

    ../../system/system.nix
    ../../system/desktop.nix
    ../../system/packages/steam.nix

    ../../user/default.nix
  ];
}