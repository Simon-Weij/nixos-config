{
  config,
  pkgs,
  inputs,
  flakeConfig,
  ...
}:
let
  username = flakeConfig.username;
in
{
  imports = [
    ./bashrc.nix
    ./discord.nix
    ./config/niri/niri.nix
    ./config/rofi/rofi.nix
    ./config/waybar/waybar.nix
    ./config/mako/mako.nix
    ./apps/zen.nix
    ./apps/spicetify.nix
    ./theme.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/" + username;
  home.stateVersion = flakeConfig.stateVersion;
}
