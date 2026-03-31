{
  pkgs,
  inputs,
  ...
}: {
  flake.nixosModules.desktop-hardening = {pkgs, ...}: {
    networking.firewall.enable = true;
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.login.enableGnomeKeyring = true;

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
      config.common.default = "*";
    };
  };
}
