{ config, pkgs, inputs, ... }:
let 
  flakeConfig = import ../../flake-config.nix;
in
{
  imports = [
    ./discord.nix
    ./bashrc.nix
    ./gnome.nix
    inputs.nixcord.homeModules.nixcord
  ];

  programs.home-manager.enable = true;

  home.username = "simon";
  home.homeDirectory = "/home/simon";
  home.stateVersion = flakeConfig.stateVersion;
}