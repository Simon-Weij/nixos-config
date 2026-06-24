{
  pkgs,
  flakeConfig,
  ...
}: {
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };
  users.users.${flakeConfig.username}.packages = [
    pkgs.docker-compose
  ];
}
