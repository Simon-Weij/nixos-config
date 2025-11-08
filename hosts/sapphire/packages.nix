{ pkgs, unstable, ... }:
let
  username = flakeConfig.username;
in
{
  users.users."${username}".packages = [
    unstable.distrobox
    unstable.podman

    unstable.winboat
    unstable.freerdp

    unstable.heroic
  ];
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
