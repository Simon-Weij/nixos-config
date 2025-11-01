{ config, pkgs, inputs, flakeConfig, ... }:
let
  username = flakeConfig.username;
in
{
  imports = [
    ./bashrc.nix
    ./discord.nix
    ./gnome.nix
    ./apps/zen.nix
    ./apps/spicetify.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/" + username;
  home.stateVersion = flakeConfig.stateVersion;
}