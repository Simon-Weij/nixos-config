{
  pkgs,
  lib,
  flakeConfig,
  ...
}: let
  hytale-hash = "sha256-8tWZakGhG0CXiH8yP+Nxukye0XdxbFwYS0H6n2x7AGc=";
in {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  users.users."${flakeConfig.username}".packages = with pkgs; [
    heroic
  ];

  services.flatpak = {
    enable = true;
    packages = [
      "org.prismlauncher.PrismLauncher"
      "org.vinegarhq.Sober"
      "com.usebottles.bottles"
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
