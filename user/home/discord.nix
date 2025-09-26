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

  home.file.".config/vesktop/settings/settings.json".source = ../files/settings.json;
  home.file.".config/vesktop/settings.json".source = ../files/vesktop.json;
}