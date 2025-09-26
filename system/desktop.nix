{ pkgs, ... }:
{
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    cheese
    eog
    epiphany
    evince
    geary
    gnome-characters
    gnome-clocks
    gnome-contacts
    gnome-calendar
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-weather
    simple-scan
    totem
    yelp
    gnome-calculator
    seahorse
    pkgs.gnome-tour
  ];

  services.xserver.enable = true;
}