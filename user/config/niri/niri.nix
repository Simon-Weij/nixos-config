{
  pkgs,
  inputs,
  flakeConfig,
  lib,
  ...
}: let
  unstable = import inputs.unstable {
    system = pkgs.stdenv.hostPlatform.system;
  };
  waybarModule = import ./waybar/waybar.nix {
    pkgs = unstable;
    wrappers = inputs.wrappers;
    inherit flakeConfig;
    inherit lib;
  };
in {
  environment.systemPackages = [
    unstable.swaylock
    unstable.xwayland
    unstable.xwayland-satellite
    unstable.swww
    unstable.pavucontrol
    unstable.libnotify
    unstable.overskride
    unstable.playerctl

    waybarModule.package
  ];
}
