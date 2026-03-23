{inputs, ...}: {
  flake.nixosModules.theme = {pkgs, ...}: {
    programs.dconf = {
      enable = true;
      profiles.user.databases = [
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
    };

    environment.systemPackages = [
      pkgs.adwaita-icon-theme
    ];
  };
}
