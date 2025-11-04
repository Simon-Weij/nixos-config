{
  config,
  pkgs,
  lib,
  flakeConfig,
  ...
}:
{
  home.file.".config/rofi/config.rasi" = {
    source = ./config.rasi;
  };
}