{...}: {
  services = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    gnome.core-apps.enable = false;
  };
}
