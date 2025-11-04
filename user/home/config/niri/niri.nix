{
  config,
  pkgs,
  lib,
  flakeConfig,
  ...
}:
{
  programs.niri.config = builtins.readFile ./config.kdl;

  home.file."Pictures/wallpapers/wallpaper.png" = {
    source = "${pkgs.fetchurl flakeConfig.wallpaper}";
    recursive = true;
  };
}
