{ pkgs, flakeConfig, ... }:
{
  users.users."${flakeConfig.username}" = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    hashedPassword = "REMOVED";
  };
}
