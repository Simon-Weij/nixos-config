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
in {
  users.users."${flakeConfig.username}".packages = [
    inputs.fluxer.packages.${pkgs.stdenv.hostPlatform.system}.default
    vesktopModule.package
  ];
  services.flatpak = {
    enable = true;
    packages = [
      "in.cinny.Cinny"
    ];
  };
}
