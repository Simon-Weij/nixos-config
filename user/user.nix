{ pkgs, flakeConfig, ... }:
{
  users.users."${flakeConfig.username}" = {
    isNormalUser = true;
    description = "Simon";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    hashedPassword = "REMOVED";
  };
}