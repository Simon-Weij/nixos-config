{
  flakeConfig,
  pkgs,
  ...
}: {
  imports = [
    ./noctalia/noctalia.nix
  ];

  programs.umbriel.enable = true;

  environment.systemPackages = with pkgs; [
    polkit_gnome
    playerctl
    adwaita-icon-theme
    bibata-cursors
    brightnessctl
  ];

  services.gnome.gnome-keyring.enable = true;

  security = {
    pam = {
      enable = true;
      services.login.enableGnomeKeyring = true;
    };
    polkit.enable = true;
  };

  systemd.user.services.polkit-gnome-authentication-agent = {
    description = "Polkit gnome Authentication Agent";
    wantedBy = ["graphical-session.target"];
    serviceConfig = {
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
    };
  };

  services = {
    keyd = {
      enable = true;
      keyboards.default = {
        ids = ["*"];
        settings.main.capslock = "f12";
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
  networking = {
    networkmanager.enable = true;
    hostName = flakeConfig.networking.hostName;
    firewall.enable = true;
  };

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

  xdg.portal = {
    enable = true;
    config.common.default = ["gnome"];
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  fonts = {
    packages = with pkgs; [
      nerd-fonts.profont
      noto-fonts-color-emoji
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = ["ProFont Nerd Font"];
        sansSerif = ["ProFont Nerd Font"];
        serif = ["ProFont Nerd Font"];
      };
    };
  };

  hjem = {
    clobberByDefault = true;
    users."${flakeConfig.username}" = {
      user = "${flakeConfig.username}";
      directory = "/home/${flakeConfig.username}";
      files = {
        ".config/umbriel/config.toml" = {
          source = ./umbriel/config.toml;
          type = "copy";
          permissions = "0644";
        };
        ".config/umbriel/keybinds.toml" = {
          source = ./umbriel/keybinds.toml;
          type = "copy";
          permissions = "0644";
        };
        ".config/umbriel/outputs.toml" = {
          source =
            if flakeConfig.isLaptop
            then ./umbriel/outputs-laptop.toml
            else ./umbriel/outputs.toml;
          type = "copy";
          permissions = "0644";
        };
      };
    };
  };
}
