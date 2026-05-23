{inputs, ...}: {
  flake.nixosModules.imports = {pkgs, ...}: {
    imports = [
      inputs.disko.nixosModules.disko
      inputs.hjem.nixosModules.default
      inputs.flatpaks.nixosModules.default
      inputs.spicetify-nix.nixosModules.default
      inputs.lanzaboote.nixosModules.lanzaboote
      inputs.disko.nixosModules.disko
    ];
  };
}
