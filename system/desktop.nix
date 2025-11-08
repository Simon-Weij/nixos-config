{
  pkgs,
  unstable,
  inputs,
  flakeConfig,
  ...
}:
{
  nixpkgs.overlays = [ inputs.niri-flake.overlays.niri ];

  niri-flake.cache.enable = false;

  environment.systemPackages = [
    unstable.swaylock
    unstable.rofi
    unstable.yazi
    unstable.xwayland
    unstable.xwayland-satellite
    unstable.swww
    unstable.nautilus
    unstable.waybar
    unstable.mako
    unstable.nerd-fonts.jetbrains-mono
    unstable.nerd-fonts.symbols-only
    unstable.noto-fonts-color-emoji
    unstable.pavucontrol
    unstable.libnotify
    unstable.overskride
    unstable.playerctl
  ];

  programs.niri = {
    enable = true;
    package = flakeConfig.niri-package;
  };

  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
      dejavu_fonts
      noto-fonts-color-emoji
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [
          "JetBrainsMono Nerd Font"
          "Symbols Nerd Font"
        ];
        sansSerif = [ "DejaVu Sans" ];
        serif = [ "DejaVu Serif" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
