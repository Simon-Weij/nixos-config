{pkgs, ...}: {
  programs.dconf.profiles.user.databases = [
    {
      lockAll = true;
      settings = {
        "org/gnome/desktop/interface" = {
          accent-color = "blue";
          color-scheme = "prefer-dark";
          icon-theme = "Adwaita";
          gtk-enable-primary-paste = false;
        };
      };
    }
  ];

  environment.systemPackages = [
    pkgs.adwaita-icon-theme
    pkgs.libsForQt5.qtstyleplugin-kvantum
    pkgs.libsForQt5.qt5ct
    pkgs.kdePackages.qtstyleplugin-kvantum
    pkgs.kdePackages.qt6ct
    pkgs.darkly
    pkgs.darkly-qt5
  ];

  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT6_QPA_PLATFORMTHEME = "qt6ct";
    QT_STYLE_OVERRIDE = "kvantum";
  };
}
