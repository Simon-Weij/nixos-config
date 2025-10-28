{ pkgs, unstable, inputs, flakeConfig, ... }:
let username = flakeConfig.username;
in {
  users.users."${username}".packages = [
    # system
    unstable.firefox
    unstable.ungoogled-chromium
    unstable.ghostty
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
    pkgs.treefmt

    unstable.gh
    unstable.git

    unstable.nil
    unstable.gopls

    unstable.nodePackages."@angular/cli"

    unstable.nodejs
    unstable.zulu21
    unstable.go
    unstable.element-web

    unstable.unityhub

    unstable.dotnetCorePackages.sdk_9_0_1xx-bin
    unstable.gcc
    unstable.ninja
    unstable.gnumake
    unstable.vcpkg
    unstable.cmake

    unstable.rustc
    unstable.cargo
    unstable.rustfmt
    unstable.rust-analyzer
    unstable.sccache
    unstable.pkg-config
    unstable.openssl

    pkgs.rustup

    pkgs.jetbrains.rust-rover

    pkgs.jetbrains.clion

    unstable.winboat
    inputs.nix-init.packages.${pkgs.stdenv.system}.nix-init

    unstable.obsidian

    unstable.postman
  ];

  virtualisation.docker.enable = true;

  nixpkgs.config.permittedInsecurePackages = [ "libsoup-2.74.3" ];

  services.flatpak = {
    enable = true;
    packages = [
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
      {
        appId = "com.freerdp.FreeRDP";
        origin = "flathub";
      }
    ];
  };
}
