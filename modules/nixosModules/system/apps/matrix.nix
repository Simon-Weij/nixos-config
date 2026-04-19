{inputs, ...}: {
  flake.nixosModules.matrix = {
    pkgs,
    flakeConfig,
    ...
  }: let
    commetHash = "sha256-knMzXnVgzvfYW7NxN8Al8FA8Q+9QLLfQyTrHZ/wLs0c=";
  in {
    users.users."${flakeConfig.username}".packages = [
      inputs.fluxer.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    services.flatpak = {
      enable = true;
      forceRunOnActivation = true;
      packages = [
        ":${pkgs.fetchurl {
          url = "https://github.com/commetchat/commet/releases/download/v0.4.1/chat.commet.commetapp.flatpak";
          sha256 = commetHash;
          name = "chat.commet.commetapp.flatpak";
        }}"
      ];
    };
  };
}
