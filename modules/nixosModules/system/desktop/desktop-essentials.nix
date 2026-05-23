{...}: {
  flake.nixosModules.desktop-essentials = {
    pkgs,
    flakeConfig,
    ...
  }: {
    users.users."${flakeConfig.username}".packages = with pkgs; [
      ghostty
      (pkgs.symlinkJoin {
        name = "essential-icons";
        paths = [pkgs.vlc pkgs.nautilus pkgs.teams-for-linux];
        pathsToLink = ["/share/icons"];
      })
    ];

    programs.firejail.enable = true;
    programs.firejail.wrappedBinaries.vlc = {
      executable = "${pkgs.vlc}/bin/vlc";
      profile = "${pkgs.firejail}/etc/firejail/vlc.profile";
      desktop = "${pkgs.vlc}/share/applications/vlc.desktop";
    };
    programs.firejail.wrappedBinaries.nautilus = {
      executable = "${pkgs.nautilus}/bin/nautilus";
      profile = "${pkgs.firejail}/etc/firejail/nautilus.profile";
      desktop = "${pkgs.nautilus}/share/applications/org.gnome.Nautilus.desktop";
    };
    programs.firejail.wrappedBinaries.teams-for-linux = {
      executable = "${pkgs.teams-for-linux}/bin/teams-for-linux";
      profile = "${pkgs.firejail}/etc/firejail/teams-for-linux.profile";
      desktop = "${pkgs.teams-for-linux}/share/applications/teams-for-linux.desktop";
    };
  };
}
