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
      linuxHeaders

      #development
      unstable.vscode
      github-desktop
      git
      nodejs
      nodePackages."@angular/cli"
      nodePackages."@nestjs/cli"
      hoppscotch
      distrobox

      python313
      poetry
      jetbrains.pycharm

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
