{
  pkgs,
  flakeConfig,
  inputs,
  ...
}: let
  username = flakeConfig.username;
  unstable = import inputs.unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in {
  users.users."${username}" = {
    packages = with pkgs; [
      #packages
      heroic
      vesktop
      steam
      vlc
      teams-for-linux
      nautilus
      gnome-console
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      thunderbird
      gradia
      chromium

      #development
      unstable.vscode
      github-desktop
      git
      nodejs
      hoppscotch
      distrobox
      openjdk25
      gnome-builder

      python313
      poetry
      jetbrains.idea-oss

      #nix
      nh
      alejandra
      nixd
    ];
  };

  virtualisation.docker.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
}
