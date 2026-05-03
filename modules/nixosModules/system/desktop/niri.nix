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
      (inputs.wrapper-modules.wrappers.niri.apply {
        inherit pkgs;
        v2-settings = true;
        settings = {
          prefer-no-csd = true;

          hotkey-overlay.skip-at-startup = true;

          screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

          spawn-at-startup = [
            [(lib.getExe self'.packages.noctaliaWrapped)]
          ];

          layer-rule = {
            match = _: {
              props = {
                namespace = "^noctalia-overview.*";
              };
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
            touchpad.natural-scroll = _: {};
          };

          outputs = {
            "HDMI-A-1" = {
              mode = "1920x1080@165.003";
              scale = 1;
              transform = "normal";
              position = _: {
                props = {
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
            "Mod+Shift+Slash" = _: {
              content.show-hotkey-overlay = _: {};
            };
            "Mod+T" = _: {
              props = {
                hotkey-overlay-title = "Open a Terminal: ghostty";
              };
              content.spawn = "ghostty";
            };
            "Shift+Escape" = _: {
              content.screenshot = _: {};
            };
            "Super+Space" = _: {
              props = {
                hotkey-overlay-title = "Run an Application: rofi";
              };
              content.spawn = [(lib.getExe self'.packages.noctaliaWrapped) "ipc" "call" "launcher" "toggle"];
            };
            "Mod+V" = _: {
              props = {
                hotkey-overlay-title = "Open control panel";
              };
              content.spawn = [(lib.getExe self'.packages.noctaliaWrapped) "ipc" "call" "controlCenter" "toggle"];
            };

            "Mod+D" = _: {
              props = {
                repeat = false;
              };
              content.toggle-overview = _: {};
            };
            "Mod+Q" = _: {
              props = {
                repeat = false;
              };
              content.close-window = _: {};
            };
            "Mod+O" = _: {
              props = {
                repeat = false;
              };
              content.switch-focus-between-floating-and-tiling = _: {};
            };

            "Mod+H" = _: { content.focus-column-left = _: {}; };
            "Mod+L" = _: { content.focus-column-right = _: {}; };
            "Mod+J" = _: { content.focus-workspace-down = _: {}; };
            "Mod+K" = _: { content.focus-workspace-up = _: {}; };

            "Mod+Alt+H" = _: { content.move-column-left = _: {}; };
            "Mod+Alt+J" = _: { content.move-window-to-workspace-down = _: {}; };
            "Mod+Alt+K" = _: { content.move-window-to-workspace-up = _: {}; };
            "Mod+Alt+L" = _: { content.move-column-right = _: {}; };

            "Mod+R" = _: { content.switch-preset-column-width = _: {}; };
            "Mod+F" = _: { content.maximize-column = _: {}; };

            "XF86AudioRaiseVolume" = _: {
              props = {
                allow-when-locked = true;
              };
              content.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
            };
            "XF86AudioLowerVolume" = _: {
              props = {
                allow-when-locked = true;
              };
              content.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
            };
            "XF86AudioMute" = _: {
              props = {
                allow-when-locked = true;
              };
              content.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            };
            "XF86AudioMicMute" = _: {
              props = {
                allow-when-locked = true;
              };
              content.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
            };
            "XF86MonBrightnessUp" = _: {
              props = {
                allow-when-locked = true;
              };
              content.spawn = ["brightnessctl" "--class=backlight" "set" "+10%"];
            };
            "XF86MonBrightnessDown" = _: {
              props = {
                allow-when-locked = true;
              };
              content.spawn = ["brightnessctl" "--class=backlight" "set" "10%-"];
            };
            "XF86AudioPlay" = _: {
              props = {
                allow-when-locked = true;
              };
              content.spawn-sh = "playerctl play-pause";
            };
            "XF86AudioPause" = _: {
              props = {
                allow-when-locked = true;
              };
              content.spawn-sh = "playerctl play-pause";
            };
            "XF86AudioNext" = _: {
              props = {
                allow-when-locked = true;
              };
              content.spawn-sh = "playerctl next";
            };
            "XF86AudioPrev" = _: {
              props = {
                allow-when-locked = true;
              };
              content.spawn-sh = "playerctl previous";
            };
          };
        };
      }).wrapper;
  };
}
