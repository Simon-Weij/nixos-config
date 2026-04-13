{inputs, ...}: {
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
    nix.package = pkgs.lixPackageSets.stable.lix;
    documentation.nixos.enable = false;
    system.stateVersion = flakeConfig.stateVersion;
  };
}
