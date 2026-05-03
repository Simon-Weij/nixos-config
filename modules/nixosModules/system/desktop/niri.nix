{inputs, ...}: {
  flake.nixosModules.niri = {
    pkgs,
    self,
    ...
  }: {
    environment.systemPackages = [
      pkgs.xwayland
      pkgs.xwayland-satellite
      pkgs.pavucontrol
      pkgs.libnotify
      pkgs.playerctl
      pkgs.overskride
      pkgs.polkit_gnome
      self.packages.${pkgs.stdenv.hostPlatform.system}.noctaliaWrapped
    ];
    services.upower.enable = true;
    services.power-profiles-daemon.enable = true;

    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.niriWrapped;
    };

    systemd.user.services.polkit-gnome-authentication-agent = {
      description = "Polkit gnome Authentication Agent";
      wantedBy = ["graphical-session.target"];
      serviceConfig = {
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
      };
    };

    services.udisks2.enable = true;
    security.polkit.enable = true;
  };

  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.niriWrapped =
      (inputs.wrappers.wrapperModules.niri.apply {
        inherit pkgs;
        settings = {
          prefer-no-csd = true;

          hotkey-overlay.skip-at-startup = true;

          screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

          spawn-at-startup = [
            [(lib.getExe self'.packages.noctaliaWrapped)]
          ];

          layer-rule = {
            match = {
              _attrs.namespace = "^noctalia-overview.*";
            };
            place-within-backdrop = true;
          };

          layout = {
            gaps = 3;
            center-focused-column = "never";
            preset-column-widths = [
              {proportion = 0.33;}
              {proportion = 0.5;}
              {proportion = 0.7;}
              {proportion = 0.95;}
            ];
            default-column-width = {proportion = 0.5;};
            focus-ring = {
              width = 1;
              active-color = "#0262acff";
              inactive-color = "#505050";
            };
          };

          window-rules = [
            {
              geometry-corner-radius = 12;
              clip-to-geometry = true;
            }
          ];

          input = {
            mouse.accel-profile = "flat";
            touchpad.natural-scroll = null;
          };

          outputs = {
            "HDMI-A-1" = {
              mode = "1920x1080@165.003";
              scale = 1;
              transform = "normal";
              position = {
                _attrs = {
                  x = 0;
                  y = 0;
                };
              };
            };
          };

          cursor = {
            xcursor-theme = "Adwaita";
            xcursor-size = 16;
          };

          binds = {
            "Mod+Shift+Slash".show-hotkey-overlay = null;
            "Mod+T" = {
              _attrs.hotkey-overlay-title = "Open a Terminal: ghostty";
              spawn = "ghostty";
            };
            "Shift+Escape".screenshot = null;
            "Super+Space" = {
              _attrs.hotkey-overlay-title = "Run an Application: rofi";
              spawn = [(lib.getExe self'.packages.noctaliaWrapped) "ipc" "call" "launcher" "toggle"];
            };
            "Mod+V" = {
              _attrs.hotkey-overlay-title = "Open control panel";
              spawn = [(lib.getExe self'.packages.noctaliaWrapped) "ipc" "call" "controlCenter" "toggle"];
            };

            "Mod+D" = {
              _attrs.repeat = false;
              toggle-overview = null;
            };
            "Mod+Q" = {
              _attrs.repeat = false;
              close-window = null;
            };
            "Mod+O" = {
              _attrs.repeat = false;
              switch-focus-between-floating-and-tiling = null;
            };

            "Mod+H".focus-column-left = null;
            "Mod+L".focus-column-right = null;
            "Mod+J".focus-workspace-down = null;
            "Mod+K".focus-workspace-up = null;

            "Mod+Alt+H".move-column-left = null;
            "Mod+Alt+J".move-window-to-workspace-down = null;
            "Mod+Alt+K".move-window-to-workspace-up = null;
            "Mod+Alt+L".move-column-right = null;

            "Mod+R".switch-preset-column-width = null;
            "Mod+F".maximize-column = null;

            "XF86AudioRaiseVolume" = {
              _attrs.allow-when-locked = true;
              spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
            };
            "XF86AudioLowerVolume" = {
              _attrs.allow-when-locked = true;
              spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
            };
            "XF86AudioMute" = {
              _attrs.allow-when-locked = true;
              spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            };
            "XF86AudioMicMute" = {
              _attrs.allow-when-locked = true;
              spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
            };
            "XF86MonBrightnessUp" = {
              _attrs.allow-when-locked = true;
              spawn = ["brightnessctl" "--class=backlight" "set" "+10%"];
            };
            "XF86MonBrightnessDown" = {
              _attrs.allow-when-locked = true;
              spawn = ["brightnessctl" "--class=backlight" "set" "10%-"];
            };
            "XF86AudioPlay" = {
              _attrs.allow-when-locked = true;
              spawn-sh = "playerctl play-pause";
            };
            "XF86AudioPause" = {
              _attrs.allow-when-locked = true;
              spawn-sh = "playerctl play-pause";
            };
            "XF86AudioNext" = {
              _attrs.allow-when-locked = true;
              spawn-sh = "playerctl next";
            };
            "XF86AudioPrev" = {
              _attrs.allow-when-locked = true;
              spawn-sh = "playerctl previous";
            };
          };
        };
      }).wrapper;
  };
}
