{inputs, ...}: {
  flake.nixosModules.gaming = {
    pkgs,
    lib,
    flakeConfig,
    ...
  }: let
    unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    users.users."${flakeConfig.username}".packages = [
      unstable.pandora-launcher
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
