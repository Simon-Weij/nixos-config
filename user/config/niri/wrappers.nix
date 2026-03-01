{
  inputs,
  pkgs,
  ...
}: let
  dotfiles = ./.;
  mkConfigWrapper = package: flag: conf:
    inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.${package};
      flags.${flag} = "${dotfiles}/${conf}";
    };

  mako = mkConfigWrapper "mako" "--config" "mako";
  rofi = mkConfigWrapper "rofi" "-config" "rofi.rasi";
in {
  environment.systemPackages = [
    mako
    rofi
  ];

  programs.niri.enable = true;
}
