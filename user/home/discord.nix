{ pkgs, inputs, ... }:

let
  flakeConfig = import ../../flake-config.nix;
in
{
  xdg.desktopEntries.vesktop = {
    name = "Discord";
    exec = "vesktop --enable-features=VaapiIgnoreDriverChecks,VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,UseMultiPlaneFormatForHardwareVideo";
    icon = ../appIcons/Discord.png;
    type = "Application";
    terminal = false;
    categories = [ "Network" "Chat" ];
  };
}