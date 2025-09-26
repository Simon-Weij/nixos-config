{ pkgs, inputs, ... }:

let
  flakeConfig = import ../../flake-config.nix;
in
{
  xdg.desktopEntries.vesktop = {
    name = "Discord";
    exec = "vesktop --enable-features=VaapiIgnoreDriverChecks,VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,UseMultiPlaneFormatForHardwareVideo";
    icon = flakeConfig.flakePath + "/user/appIcons/Discord.png";
    type = "Application";
    terminal = false;
    categories = [ "Network" "Chat" ];
  };

  programs.nixcord = {
    enable = true;
    discord.enable = true;
    vesktop.enable = true;

    config = {
      autoUpdate = true;
      plugins = {
        messageLogger.enable = true;
        translate.enable = true;
        callTimer.enable = true;
        clearURLs.enable = true;
        fakeNitro.enable = true;
        favoriteGifSearch.enable = true;
        favoriteEmojiFirst.enable = true;
        friendsSince.enable = true;
        gifPaste.enable = true;
        memberCount.enable = true;
        noBlockedMessages.enable = true;
        noF1.enable = true;
        onePingPerDM.enable = true;
      };
    };
  };


}