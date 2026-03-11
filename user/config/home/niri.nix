{flakeConfig, ...}: let
  username = flakeConfig.username;
in {
  hjem = {
    users."${username}" = {
      user = "${username}";
      directory = "/home/${username}";
      files = {
        ".config/niri/config.kdl" = {
          source = ../niri/niri.kdl;
          type = "copy";
          permissions = "0644";
        };
      };
    };
  };
}
