{inputs, ...}: {
  flake.nixosModules.gaming = {
    pkgs,
    lib,
    flakeConfig,
    ...
  }: let
    #    hytale-hash = "sha256-uu7FA36M4wSqDXRF1ffN1a8S5MjL1N1kZi4gwbpw1oY=";
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
        #        {
        #         appId = "com.hytale.Launcher";
        #        sha256 = hytale-hash;
        #       bundle = "${pkgs.fetchurl {
        #        url = "https://launcher.hytale.com/builds/release/linux/amd64/hytale-launcher-latest.flatpak";
        #       sha256 = hytale-hash;
        #    }}";
        #   }
      ];
    };
  };
}
