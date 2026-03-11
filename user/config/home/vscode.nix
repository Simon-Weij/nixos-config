{flakeConfig, ...}: let
  username = flakeConfig.username;
in {
  hjem = {
    users."${username}" = {
      user = "${username}";
      directory = "/home/${username}";
      files = {
        ".config/VSCodium/User/settings.json" = {
          source = ../vscode/settings.json;
          type = "copy";
          permissions = "0644";
        };
      };
    };
  };
}
