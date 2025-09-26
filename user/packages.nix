{ pkgs, unstable, inputs, ... }:
let 
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  users.users.simon.packages = [
    # system
    pkgs.gnomeExtensions.blur-my-shell
    pkgs.gnomeExtensions.hide-minimized
    pkgs.gnomeExtensions.middle-click-to-close-in-overview

    unstable.firefox
    unstable.ungoogled-chromium
    unstable.gnome-terminal
    unstable.gnome-extension-manager
    unstable.distrobox
    unstable.podman
    unstable.nh

    # gaming
    unstable.heroic
    unstable.vesktop

    # creative
    unstable.krita

    # office
    pkgs.onlyoffice-bin
    unstable.teams-for-linux

    # development
    unstable.vscode
    pkgs.jetbrains.idea-community-bin
    pkgs.jetbrains.pycharm-community-bin

    unstable.github-desktop

    unstable.gh
    unstable.git

    unstable.nil
    unstable.gopls

    unstable.nodePackages."@angular/cli"

    unstable.nodejs
    unstable.zulu21
    unstable.go
  ];


  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  virtualisation.docker.enable = true;

  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.catppuccin;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      shuffle
    ];
  };

  services.flatpak = {
    enable = true;
    packages = [
      { appId = "org.vinegarhq.Sober"; origin = "flathub"; }
      { appId = "org.prismlauncher.PrismLauncher"; origin = "flathub"; }
      { appId = "org.gnome.Boxes"; origin = "flathub"; }
    ];
  };
}