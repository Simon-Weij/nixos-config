{
  pkgs,
  flakeConfig,
  inputs,
  ...
}: let
  username = flakeConfig.username;
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
  unstable = import inputs.unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
  veryunstable = import inputs.veryunstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };

  vesktopModule = import ./user/config/vesktop/vesktop.nix {
    inherit pkgs;
    wrappers = inputs.wrappers;
  };

  vscodeModule = import ./user/config/vscode/vscode.nix {
    inherit pkgs;
    inherit lib;
  };
in {
  users.users."${username}" = {
    packages = with pkgs; [
      #packages
      vlc
      teams-for-linux
      nautilus
      gnome-console
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      inputs.fluxer.packages.${pkgs.stdenv.hostPlatform.system}.default
      vscodeModule
      thunderbird
      gradia
      vesktopModule.package
      penpot-desktop
      olympus

      #development
      github-desktop
      git
      nodejs
      veryunstable.hoppscotch
      distrobox
      openjdk25
      poetry
      android-studio
      unstable.stoat-desktop

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

  services.flatpak = {
    enable = true;
    packages = [
      "in.cinny.Cinny"
    ];
  };

  virtualisation.docker.enable = true;
  nixpkgs.config.allowUnfree = true;
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
}
