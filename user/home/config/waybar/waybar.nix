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
          "custom/spotify"
          "bluetooth"
          "pulseaudio"
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
      }
    ];
    style = builtins.readFile ./style.css;
  };
}
