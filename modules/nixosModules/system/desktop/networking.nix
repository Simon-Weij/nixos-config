{...}: {
  flake.nixosModules.networking = {
    pkgs,
    flakeConfig,
    ...
  }: {
    networking.networkmanager.enable = true;
    networking.hostName = flakeConfig.networking.hostName;
  };
}
