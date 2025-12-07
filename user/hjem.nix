{ pkgs, flakeConfig, ... }:
let
  username = flakeConfig.username;
  bashrcFiles = import ./config/bashrc/bashrc.nix { inherit flakeConfig; };
  vesktopFiles = import ./config/vesktop/vesktop.nix;
in
{
  hjem.users."${username}" = {
    user = "${username}";
    directory = "/home/${username}";
    files = bashrcFiles // vesktopFiles;
  };
}