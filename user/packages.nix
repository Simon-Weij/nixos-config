{
  pkgs,
  unstable,
  inputs,
  flakeConfig,
  ...
}:
let
  username = flakeConfig.username;
in
{
  users.users."${username}".packages = [
    # system
    unstable.firefox
    unstable.ungoogled-chromium
    unstable.ghostty
    unstable.gnome-extension-manager
    unstable.distrobox
    unstable.podman
    unstable.nh
    unstable.freerdp

    # gaming
    unstable.heroic
    unstable.vesktop

    # office
    unstable.teams-for-linux

    # development
    unstable.vscode
    pkgs.jetbrains.idea-community-bin

    unstable.github-desktop
    unstable.treefmt

    unstable.gh
    unstable.git
    unstable.git-lfs

    unstable.nil
    unstable.gopls

    unstable.nodePackages."@angular/cli"
    unstable.nodePackages."@nestjs/cli"

    unstable.nodejs
    unstable.go

    unstable.winboat
    unstable.postman

    unstable.overskride
    unstable.playerctl

    inputs.nvim.packages.${pkgs.stdenv.system}.default
  ];

  virtualisation.docker.enable = true;

  services.flatpak = {
    enable = true;
    packages = [
      {
        appId = "org.onlyoffice.desktopeditors";
        origin = "flathub";
      }
      {
        appId = "org.vinegarhq.Sober";
        origin = "flathub";
      }
      {
        appId = "org.prismlauncher.PrismLauncher";
        origin = "flathub";
      }
      {
        appId = "org.gnome.Boxes";
        origin = "flathub";
      }
      {
        appId = "in.cinny.Cinny";
        origin = "flathub";
      }
      {
        appId = "com.ktechpit.whatsie";
        origin = "flathub";
      }
    ];
  };
}
