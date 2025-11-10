{
  config,
  pkgs,
  lib,
  flakeConfig,
  ...
}:
{
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        modules-left = [ "niri/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
          "backlight"
          "battery"
          "pulseaudio"
          "power-profiles-daemon"
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
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          on-click = "pavucontrol";
          on-click-middle = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-scroll-up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
          on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        };
        "battery" = lib.mkIf (flakeConfig.networking.hostName == "onyx") {
          format = "{icon} {capacity}%";
          format-icons = {
            discharging = [
              ""
              ""
              ""
              ""
              ""
            ];
            charging = [
              "󰢟"
              "󰂆"
              "󰂇"
              "󰂈"
              "󰢝"
              "󰂉"
              "󰢞"
              "󰂊"
              "󰂋"
              "󰂅"
            ];
          };
        };
        "backlight" = lib.mkIf (flakeConfig.networking.hostName == "onyx") {
          format = "{icon} {percent}%";
          format-icons = [
            "󰃞"
            "󰃟"
            "󰃠"
          ];
          on-scroll-up = "brightnessctl set +5%";
          on-scroll-down = "brightnessctl set 5%-";
        };

        "power-profiles-daemon" = lib.mkIf (flakeConfig.networking.hostName == "onyx") {
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
      }
    ];
    style = builtins.readFile ./style.css;
  };
}
