{inputs, ...}: {
  flake.nixosModules.development = {
    pkgs,
    flakeConfig,
    ...
  }: {
    users.users."${flakeConfig.username}" = {
      packages = with pkgs; [
        git
        distrobox
        act
        inputs.crush.packages.${pkgs.stdenv.hostPlatform.system}.crush
        alejandra
        nixd
        (pkgs.symlinkJoin {
          name = "dev-icons";
          paths = [pkgs.github-desktop pkgs.bruno pkgs.android-studio];
          pathsToLink = ["/share/icons"];
        })
      ];
    };

    programs.firejail.wrappedBinaries = {
      github-desktop = {
        executable = "${pkgs.github-desktop}/bin/github-desktop";
        profile = "${pkgs.firejail}/etc/firejail/github-desktop.profile";
        desktop = "${pkgs.github-desktop}/share/applications/github-desktop.desktop";
      };
      bruno = {
        executable = "${pkgs.bruno}/bin/bruno";
        profile = "${pkgs.firejail}/etc/firejail/bruno.profile";
        desktop = "${pkgs.bruno}/share/applications/bruno.desktop";
      };
      android-studio = {
        executable = "${pkgs.android-studio}/bin/android-studio";
        profile = "${pkgs.firejail}/etc/firejail/android-studio.profile";
        desktop = "${pkgs.android-studio}/share/applications/android-studio.desktop";
      };
    };

    nix.nixPath = ["nixpkgs=${inputs.nixpkgs-unstable}"];

    programs.direnv = {
      enable = true;
      silent = true;
    };

    programs.nix-ld.enable = true;
  };
}
