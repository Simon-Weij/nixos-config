{
  programs.dconf.profiles.user.databases = [
    {
      lockAll = true;
      settings = {
        "org/gnome/desktop/interface" = {
          accent-color = "blue";
          color-scheme = "prefer-dark";
        };
        "org/gnome/desktop/wm/keybindings" = {
          close = [ "<Super>q" ];
          show-screenshot-ui = [ "<Shift>Escape" ];
        };
        "org/gnome/shell/keybindings" = {
          show-screenshot-ui = [ "<Shift>Escape" ];
        };
        "org/gnome/settings-daemon/plugins/media-keys" = {
          custom-keybindings = [
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          ];
        };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
          binding = "<Super>t";
          command = "kgx";
          name = "Terminal";
        };
      };
    }
  ];
}
