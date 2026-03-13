{
  pkgs,
  inputs,
  ...
}: {
  flake.nixosModules.wrappers = {pkgs, ...}: let
    dotfiles = ./.;

    mkConfigWrapper = package: flag: conf:
      inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.${package};
        flags.${flag} = "${dotfiles}/${conf}";
      };
    swaylock = mkConfigWrapper "swaylock" "--config" "swaylock";
    mako = mkConfigWrapper "mako" "--config" "mako";
    rofi = mkConfigWrapper "rofi" "-config" "rofi.rasi";
  in {
    environment.systemPackages = [
      mako
      rofi
      swaylock

      pkgs.xwayland
      pkgs.xwayland-satellite
      pkgs.swww
      pkgs.pavucontrol
      pkgs.libnotify
      pkgs.overskride
      pkgs.playerctl
    ];

    programs.niri.enable = true;
  };
}
