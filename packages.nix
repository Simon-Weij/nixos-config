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
      blender
      chromium

      #development
      unstable.vscode
      github-desktop
      git
      nodejs
      nodePackages."@angular/cli"
      nodePackages."@nestjs/cli"
      hoppscotch
      distrobox
      openjdk25

      python313
      poetry
      jetbrains.pycharm
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
