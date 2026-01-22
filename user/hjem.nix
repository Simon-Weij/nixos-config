{
  flakeConfig,
  pkgs,
  ...
}: let
  username = flakeConfig.username;
  zshrcFiles = import ./config/zshrc/zshrc.nix {inherit flakeConfig pkgs;};
  vesktopFiles = import ./config/vesktop/vesktop.nix;
  userDirsFiles = import ./config/user-dirs/user-dirs.nix {inherit flakeConfig;};
  starshipFiles = import ./config/zshrc/starship.nix {inherit flakeConfig;};
  p10kFiles = import ./config/zshrc/p10k.nix;
in {
  hjem.users."${username}" = {
    user = "${username}";
    directory = "/home/${username}";
    files = zshrcFiles // vesktopFiles // userDirsFiles // starshipFiles // p10kFiles;
  };
}
