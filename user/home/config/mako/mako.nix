{
  config,
  pkgs,
  lib,
  flakeConfig,
  ...
}:
{
  home.file.".config/mako/config" = {
    source = ./config;
  };
}