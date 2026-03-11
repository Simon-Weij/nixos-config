{flakeConfig, ...}: {
  nix.settings = {
    warn-dirty = false;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    sandbox = true;
  };
  documentation.nixos.enable = false;
  system.stateVersion = flakeConfig.stateVersion;
}
