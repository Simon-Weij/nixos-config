{
  config,
  pkgs,
  lib,
  inputs,
  flakeConfig,
  ...
}:
let
  username = flakeConfig.username;
  hostName = flakeConfig.networking.hostName;
in
{
  imports = [ ./apps/spicetify.nix ];

  home.username = username;
  home.homeDirectory = lib.mkDefault "/home/${username}";
  home.stateVersion = flakeConfig.stateVersion;

  home.file.".local/share/applications/vesktop.desktop".text = ''
    [Desktop Entry]
    Name=Discord
    Exec=vesktop --enable-features=VaapiIgnoreDriverChecks,VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,UseMultiPlaneFormatForHardwareVideo
    Icon=${../appIcons/Discord.png}
    Type=Application
    Terminal=false
    Categories=Network;Chat;
  '';

  programs.bash = {
    enable = true;
    shellAliases = {
      neofetch = "nix run nixpkgs#fastfetch";
      config = "code ${flakeConfig.flakePath}";
      docs = "cd ~/Documents";
      dockernuke  = "docker system prune -a -f --volumes";
      dockerstop = "docker stop $(docker ps -q)";
    };

    sessionVariables = {
      NH_FLAKE = "${flakeConfig.flakePath}#${hostName}";
    };
  };
}
