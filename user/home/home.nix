{ config, pkgs, inputs, ... }:

{
  imports = [
    ./discord.nix
    ./bashrc.nix
    ./gnome.nix
  ];

  programs.home-manager.enable = true;

  home.username = "simon";
  home.homeDirectory = "/home/simon";
  home.stateVersion = "25.05";
}