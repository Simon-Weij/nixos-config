{
  inputs,
  lib,
  ...
}: {
  flake.nixosModules.nix = {
    pkgs,
    flakeConfig,
    ...
  }: {
    nix.settings = {
      warn-dirty = false;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      sandbox = true;
    };
    programs.nh = {
      enable = true;
    };
    nix.package = pkgs.lixPackageSets.stable.lix;
    documentation.nixos.enable = false;
    system.stateVersion = flakeConfig.stateVersion;

    nix.registry.nixpkgs = lib.mkForce {
      flake = inputs.nixpkgs-unstable;
    };
  };
}
