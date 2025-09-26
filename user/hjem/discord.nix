let 
  flakeConfig = import ../flake-config.nix;
in
{
  hjem.users.simon.files = {
    ".local/share/applications/vesktop.desktop".text = ''
      [Desktop Entry]
      Name=Discord
      Exec=vesktop --enable-features=VaapiIgnoreDriverChecks,VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,UseMultiPlaneFormatForHardwareVideo
      Icon=${../appIcons/Discord.png}
      Type=Application
      Terminal=false
      Categories=Network;Chat;
    '';
  };
}