{
  config,
  lib,
  pkgs,
  flakeConfig,
  ...
}: let
  username = flakeConfig.username;
  hytale-hash = "sha256-8tWZakGhG0CXiH8yP+Nxukye0XdxbFwYS0H6n2x7AGc=";
in {
  users.users."${username}" = {
    packages = with pkgs; [
      steam
      heroic
    ];
  };
  services.flatpak = {
    enable = true;
    packages = [
      "org.prismlauncher.PrismLauncher"
      "com.dec05eba.gpu_screen_recorder"
      "org.gnome.Boxes"
      "org.vinegarhq.Sober"
      {
        appId = "com.hytale.Launcher";
        sha256 = hytale-hash;
        bundle = "${pkgs.fetchurl {
          url = "https://launcher.hytale.com/builds/release/linux/amd64/hytale-launcher-latest.flatpak";
          sha256 = hytale-hash;
        }}";
      }
    ];
  };
}
