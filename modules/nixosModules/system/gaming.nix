{inputs, ...}: {
  flake.nixosModules.gaming = {
    pkgs,
    lib,
    flakeConfig,
    ...
  }: {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    users.users."${flakeConfig.username}".packages = with pkgs; [
      heroic
      prismlauncher
      bottles
      (pkgs.symlinkJoin {
        name = "prismlauncher-icons";
        paths = [pkgs.prismlauncher];
        pathsToLink = ["/share/icons"];
      })
    ];

    programs.firejail.wrappedBinaries = {
      prismlauncher = {
        executable = "${pkgs.prismlauncher}/bin/prismlauncher";
        profile = "${pkgs.firejail}/etc/firejail/prismlauncher.profile";
        desktop = "${pkgs.prismlauncher}/share/applications/org.prismlauncher.PrismLauncher.desktop";
      };
    };

    services.flatpak = {
      enable = true;
      forceRunOnActivation = true;
      remotes = {
        flathub = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      };
      packages = [
        "flathub:app/org.vinegarhq.Sober//stable"
        "flathub:app/com.usebottles.bottles//stable"
      ];
    };
  };
}
