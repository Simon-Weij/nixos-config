{
  inputs,
  pkgs,
  lib,
  flakeConfig,
  ...
}: {
  nix.settings = {
    warn-dirty = false;
    experimental-features = [
      "nix-command"
      "flakes"
      "flake-self-attrs"
    ];
    sandbox = true;
  };
  programs.nh = {
    enable = true;
  };

  boot.loader.systemd-boot.configurationLimit = 5;

  nix = {
    nixPath = [];
    channel.enable = false;
    package = pkgs.lixPackageSets.stable.lix;
    registry.nixpkgs = lib.mkForce {
      flake = inputs.nixpkgs;
    };
  };
  documentation.nixos.enable = false;
  system.stateVersion = flakeConfig.stateVersion;
}
