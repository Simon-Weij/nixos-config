{inputs, ...}: {
  flake.nixosModules.niri = {
    pkgs,
    flakeConfig,
    ...
  }: {
    hjem = {
      users."${flakeConfig.username}" = {
        user = "${flakeConfig.username}";
        directory = "/home/${flakeConfig.username}";
        files = {
          ".config/niri/config.kdl" = {
            source = ./wrappers/niri.kdl;
            type = "copy";
            permissions = "0644";
          };
        };
      };
    };
  };
}
