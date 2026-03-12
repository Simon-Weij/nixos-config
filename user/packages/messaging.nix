{
  pkgs,
  inputs,
  flakeConfig,
  ...
}: let
  vesktopModule = import ../../user/config/vesktop/vesktop.nix {
    inherit pkgs;
    wrappers = inputs.wrappers;
  };
  commet-hash = "sha256-knMzXnVgzvfYW7NxN8Al8FA8Q+9QLLfQyTrHZ/wLs0c=";
in {
  users.users."${flakeConfig.username}".packages = [
    inputs.fluxer.packages.${pkgs.stdenv.hostPlatform.system}.default
    vesktopModule.package
  ];

  services.flatpak = {
    enable = true;
    packages = [
      {
        appId = "com.commet.app";
        sha256 = commet-hash;
        bundle = "${pkgs.fetchurl {
          url = "https://github.com/commetchat/commet/releases/download/v0.4.1/chat.commet.commetapp.flatpak";
          sha256 = commet-hash;
        }}";
      }
    ];
  };
}
