{ pkgs, flakeConfig, ... }:
{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    image = pkgs.fetchurl flakeConfig.wallpaper;
  };
  gtk = {
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };
}
