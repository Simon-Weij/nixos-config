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
  vesktopModule = import ./user/config/vesktop/vesktop.nix {
    inherit pkgs;
    wrappers = inputs.wrappers;
  };
  nautilusWrapped = import ./user/config/nautilus/nautilus.nix {
    inherit pkgs;
    inputs = inputs;
  };
in {
  users.users."${username}" = {
    packages = with pkgs; [
      #packages
      vesktopModule.package
      vlc
      teams-for-linux
      nautilusWrapped.package
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
      python313
      poetry

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
