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
    ./packages.nix
    ./../../system/security.nix

    ../../system/system.nix
    ../../system/desktop.nix

    ../../user/default.nix
  ];
}
