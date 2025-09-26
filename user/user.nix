{ pkgs, ... }:
{
  users.users.simon = {
    isNormalUser = true;
    description = "Simon";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    hashedPassword = "REMOVED";
  };
}