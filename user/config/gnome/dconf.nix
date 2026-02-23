{
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
        "org/gnome/desktop/wm/keybindings" = {
          close = ["<Super>q"];
          show-screenshot-ui = ["<Shift>Escape"];
          toggle-maximized = ["<Super>f"];
        };
        "org/gnome/settings-daemon/plugins/media-keys" = {
          custom-keybindings = [
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
          ];
        };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
          binding = "<Super>t";
          command = "kgx";
          name = "Terminal";
        };
        "org/gnome/Console" = {
          use-system-font = false;
          custom-font = "JetBrainsMono Nerd Font";
        };
      };
    }
  ];
}
