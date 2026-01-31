{flakeConfig, ...}: let
  username = flakeConfig.username;
  userDirsFiles = import ./user-dirs.nix {inherit flakeConfig;};
in {
  hjem.users."${username}" = {
    user = "${username}";
    directory = "/home/${username}";
    files = userDirsFiles;
  };
}
