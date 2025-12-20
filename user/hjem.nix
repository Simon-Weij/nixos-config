{ flakeConfig, ... }:
let
  username = flakeConfig.username;
  bashrcFiles = import ./config/bashrc/bashrc.nix { inherit flakeConfig; };
  vesktopFiles = import ./config/vesktop/vesktop.nix;
  firefoxFiles = import ./config/firefox/firefox.nix;
in
{
  hjem.users."${username}" = {
    user = "${username}";
    directory = "/home/${username}";
    files = bashrcFiles // vesktopFiles // firefoxFiles;
  };
}
