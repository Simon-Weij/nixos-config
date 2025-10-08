{ config, pkgs, inputs, flakeConfig, ... }:
let
  username = flakeConfig.username;
in
{
  imports = [
    ./discord.nix
    ./bashrc.nix
    ./gnome.nix
    ./apps/zen.nix
    ./apps/spicetify.nix
  ];

  programs.home-manager.enable = true;

  home.username = username;
  home.homeDirectory = "/home/" + username;
  home.stateVersion = flakeConfig.stateVersion;
}