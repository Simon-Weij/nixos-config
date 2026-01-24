{
  flakeConfig,
  pkgs,
  ...
}: let
  username = flakeConfig.username;
  bashrcFiles = import ./config/bashrc/bashrc.nix {inherit flakeConfig pkgs;};
  vesktopFiles = import ./config/vesktop/vesktop.nix;
  userDirsFiles = import ./config/user-dirs/user-dirs.nix {inherit flakeConfig;};
in {
  hjem.users."${username}" = {
    user = "${username}";
    directory = "/home/${username}";
    files = bashrcFiles // vesktopFiles // userDirsFiles;
  };
}
