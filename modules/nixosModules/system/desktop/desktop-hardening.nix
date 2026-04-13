{
  pkgs,
  inputs,
  ...
}: {
  flake.nixosModules.desktop-hardening = {pkgs, ...}: {
    networking.firewall.enable = true;
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.login.enableGnomeKeyring = true;

    environment.systemPackages = [
      pkgs.seahorse
    ];
  };
}
