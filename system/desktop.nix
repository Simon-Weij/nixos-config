{
  pkgs,
  unstable,
  inputs,
  flakeConfig,
  ...
}:
{
  nixpkgs.overlays = [ inputs.niri-flake.overlays.niri ];

  niri-flake.cache.enable = false;

  environment.systemPackages = [
    unstable.swaylock
    unstable.fuzzel
    unstable.yazi
    unstable.xwayland
    unstable.xwayland-satellite
    unstable.swww
    unstable.gnome-screenshot
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };
}
