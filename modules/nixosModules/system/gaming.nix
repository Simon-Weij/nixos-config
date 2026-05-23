{inputs, ...}: {
  flake.nixosModules.gaming = {
    pkgs,
    lib,
    flakeConfig,
    ...
  }: let
    pandoraPkgs = inputs.pandora.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    users.users."${flakeConfig.username}".packages = [
      pandoraPkgs.pandora-launcher
    ];

    services.flatpak = {
      enable = true;
      forceRunOnActivation = true;
      remotes = {
        flathub = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      };
      packages = [
        "flathub:app/org.vinegarhq.Sober//stable"
      ];
    };
  };
}
