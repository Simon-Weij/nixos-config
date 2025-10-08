{ pkgs, inputs, flakeConfig, ... }:

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