{
  pkgs,
  wrappers,
  ...
}: let
  vesktopDesktopItem = pkgs.makeDesktopItem {
    name = "vesktop";
    desktopName = "Discord";
    exec = "vesktop";
    icon = "${vesktopIcon}/share/icons/hicolor/48x48/apps/vesktop.png";
    type = "Application";
    terminal = false;
    categories = ["Network" "Chat"];
  };

  vesktopIcon = pkgs.runCommand "vesktop-icon" {} ''
    mkdir -p $out/share/icons/hicolor/48x48/apps
    cp ${./Discord.png} $out/share/icons/hicolor/48x48/apps/vesktop.png
  '';

  wrappedVesktop = wrappers.lib.wrapPackage {
    inherit pkgs;
    package = pkgs.vesktop;
    filesToExclude = ["share/applications/*.desktop"];
  };
in {
  package = pkgs.symlinkJoin {
    name = "vesktop";
    paths = [wrappedVesktop vesktopDesktopItem vesktopIcon];
  };
}
