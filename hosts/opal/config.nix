{
  config,
  lib,
  pkgs,
  flakeConfig,
  ...
}: {
  services.flatpak = {
    enable = true;
    packages = [
      "com.usebottles.bottles"
    ];
  };
}
