{
  inputs,
  flakeConfig,
  pkgs,
  ...
}: let
in {
  users = {
    mutableUsers = true;
    users."${flakeConfig.username}" = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      initialPassword = "password";
      shell = pkgs.zsh;
    };
  };
}
