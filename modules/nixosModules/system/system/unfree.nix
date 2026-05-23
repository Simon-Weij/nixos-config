{lib, ...}: {
  flake.nixosModules.unfree = {pkgs, ...}: {
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "spotify"
        "steam"
        "steam-unwrapped"
        "spicetify-Default"
        "unityhub"
        "corefonts"
      ];
  };
}
