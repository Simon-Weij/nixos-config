{...}: {
  flake.nixosModules.wait-online = {pkgs, ...}: {
    systemd.services."NetworkManager-wait-online".enable = false;
  };
}
