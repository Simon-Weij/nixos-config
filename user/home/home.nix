{ config, pkgs, inputs, ... }:
let
  flakeConfig = import ../../flake-config.nix;
  username = "simon";
in
{
  imports = [
    ./discord.nix
    ./bashrc.nix
    ./gnome.nix
  ];

  programs.home-manager.enable = true;

  home.username = username;
  home.homeDirectory = "/home/" + username;
  home.stateVersion = flakeConfig.stateVersion;
}