{pkgs, ...}: {
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.niri.enableGnomeKeyring = true;
}
