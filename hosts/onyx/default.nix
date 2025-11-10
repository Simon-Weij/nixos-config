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
  onyxConfig = import ./onyx.nix;
in
{
  imports = [
    ./hardware.nix

    ../../system/system.nix
    ../../system/desktop.nix
    ./packages.nix

    ../../user/default.nix
  ];
}
