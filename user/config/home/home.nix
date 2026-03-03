{
  flakeConfig,
  inputs,
  pkgs,
  ...
}: let
  username = flakeConfig.username;
  userDirsFiles = import ./user-dirs.nix {inherit flakeConfig;};
in {
  hjem = {
    clobberByDefault = true;
    linker = inputs.hjem.packages.${pkgs.stdenv.hostPlatform.system}.smfh;
    users."${username}" = {
      user = "${username}";
      directory = "/home/${username}";
      files =
        userDirsFiles
        // {
          ".config/VSCodium/User/settings.json" = {
            source = ../vscode/settings.json;
            type = "copy";
            permissions = "0644";
          };
        }
        // {
          ".config/niri/config.kdl" = {
            source = ../niri/niri.kdl;
            type = "copy";
            permissions = "0644";
          };
        };
    };
  };
}
