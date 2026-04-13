{inputs, ...}: {
  flake.nixosModules.vesktop = {
    pkgs,
    flakeConfig,
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

    wrappedVesktop = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.vesktop;
      filesToExclude = ["share/applications/*.desktop"];
    };
    package = pkgs.symlinkJoin {
      name = "vesktop";
      paths = [wrappedVesktop vesktopDesktopItem vesktopIcon];
    };
  in {
    users.users.${flakeConfig.username}.packages = [
      (pkgs.symlinkJoin {
        name = "vesktop-icons";
        paths = [package];
        pathsToLink = ["/share/icons"];
      })
    ];

    programs.firejail.wrappedBinaries.vesktop = {
      executable = "${package}/bin/vesktop";
      profile = "${pkgs.firejail}/etc/firejail/vesktop.profile";
      desktop = "${package}/share/applications/vesktop.desktop";
    };

    hjem.users.${flakeConfig.username} = {
      user = flakeConfig.username;
      directory = "/home/${flakeConfig.username}";
      files = {
        ".config/vesktop/settings.json" = {
          source = ./settings.json;
          type = "copy";
          permissions = "0644";
        };
        ".config/vesktop/settings/settings.json" = {
          source = ./vesktop-settings.json;
          type = "copy";
          permissions = "0644";
        };
      };
    };
  };
}
