{
  inputs,
  lib,
  ...
}: {
  flake.nixosModules.waybar = {
    pkgs,
    flakeConfig,
    ...
  }: let
    isOnyx = flakeConfig.networking.hostName == "onyx";

    configFile = pkgs.writeText "waybar-config.json" (builtins.toJSON [
      ({
          layer = "top";
          modules-left = ["niri/workspaces"];
          modules-center = ["clock"];
          modules-right = lib.filter (x: x != null) [
            (
              if isOnyx
              then "backlight"
              else null
            )
            (
              if isOnyx
              then "battery"
              else null
            )
            "pulseaudio"
            (
              if isOnyx
              then "power-profiles-daemon"
              else null
            )
            "bluetooth"
          ];

          "clock" = {
            format-alt = "{:%Y-%m-%d %a %H:%M}";
          };

          "bluetooth" = {
            format = "{icon}";
            format-icons = {
              enabled = "󰂯";
              disabled = "󰂲";
            };
            tooltip-format = "Open bluetooth settings";
            tooltip = true;
            on-click = "overskride";
          };

          "pulseaudio" = {
            format = "{icon} {volume}%";
            format-muted = "󰝟 {volume}%";
            format-icons = {
              default = ["󰕿" "󰖀" "󰕾"];
            };
            on-click = "pavucontrol";
            on-click-middle = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            on-scroll-up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
            on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          };
        }
        // lib.optionalAttrs isOnyx {
          "battery" = {
            format = "{icon} {capacity}%";
            format-icons = {
              discharging = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
              charging = ["󰢟" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅"];
            };
          };
          "backlight" = {
            format = "{icon} {percent}%";
            format-icons = ["󰃞" "󰃟" "󰃠"];
            on-scroll-up = "brightnessctl set +5%";
            on-scroll-down = "brightnessctl set 5%-";
          };
          "power-profiles-daemon" = {
            format = "{icon}";
            tooltip-format = "Power profile: {profile}\nDriver: {driver}";
            tooltip = true;
            format-icons = {
              default = "";
              performance = "󱐋";
              balanced = "󰾅";
              power-saver = "󰌪";
            };
          };
        })
    ]);

    styleFile = pkgs.writeText "waybar-style.css" (builtins.readFile ./style.css);
    package = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.waybar;
      flags = {
        "--config" = "${configFile}";
        "--style" = "${styleFile}";
      };
    };
  in {
    users.users.${flakeConfig.username}.packages = [package];
  };
}
