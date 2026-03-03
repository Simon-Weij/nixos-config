{
  pkgs,
  flakeConfig,
  inputs,
  lib,
  ...
}: let
  username = flakeConfig.username;
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
  unstable = import inputs.unstable {
    system = pkgs.stdenv.hostPlatform.system;
  };
  veryunstable = import inputs.veryunstable {
    system = pkgs.stdenv.hostPlatform.system;
  };

  vesktopModule = import ./user/config/vesktop/vesktop.nix {
    inherit pkgs;
    wrappers = inputs.wrappers;
  };

  vscodeModule = import ./user/config/vscode/vscode.nix {
    inherit pkgs;
  };
in {
  users.users."${username}" = {
    packages = with pkgs; [
      #packages
      vlc
      teams-for-linux
      nautilus
      gnome-console
      inputs.fluxer.packages.${pkgs.stdenv.hostPlatform.system}.default
      vesktopModule.package
      chromium
      lf

      #development
      github-desktop
      git
      bruno
      distrobox
      android-studio
      vscodeModule
      inputs.self.packages.x86_64-linux.neovim

      #nix
      nh
      alejandra
      nixd
    ];
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      shuffle
    ];
  };

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
      "steam"
      "steam-unwrapped"
      "android-studio-stable"
    ];

  services.flatpak = {
    enable = true;
    packages = [
      "in.cinny.Cinny"
    ];
  };

  virtualisation.docker.enable = true;
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
}
