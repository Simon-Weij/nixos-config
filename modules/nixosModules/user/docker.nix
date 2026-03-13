{inputs, ...}: {
  flake.nixosModules.docker = {
    pkgs,
    flakeConfig,
    ...
  }: {
    users.users."${flakeConfig.username}".extraGroups = [
      "docker"
    ];
    virtualisation.docker.enable = true;
  };
}
